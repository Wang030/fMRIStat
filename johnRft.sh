#!/bin/bash
############################
#Long usage function
function usage() {
echo '''
jmd_rft_mcc.sh

performs multiple comparisons correction using a random field theory method for MINC z and t statistical maps (Worsley et al., 1996). Matlab must be installed with stat_threshold.m (http://www.math.mcgill.ca/keith/fmristat/toolbox/stat_threshold.m). Output is a thresholded z or t map and a mcc_rft_info.txt file. The Info file reports mask, threshold, Cumulative smoothing input, maximum cluster volume, number of significant clusters within mask or unmasked data, and volume of significant voxels. 

General options:
-o/output	Output directory (Default: PWD)
-m/--mask	Mask cc output image. If --volume is null, RFT search volume is derived from mask
--volume	Specify the RFT search volume in mm^3. This will override --mask volume
		(Default: ICBM152_2009a forebrain volume-1.5 million voxels) 
--pval	 	Specify significant threshold p-value (<1 & >0) (default: 0.05)
-d/--df		If using a t-map, degrees of freedom must be specified 
		If flag is null, it will assume the input is a z-map and infinite df will be used
--hrrt		Accounts for inherent smoothing the HRRT PET Scanner (~2mm FWHM)
--hrplus	Accounts for inherent smoothing of the ECAT HR-Plus PET Scanner (~6mm FWHM)
-s/--smooth	Smoothing kernel applied to input z/t-map (default: 0)
		If using with a PET scanner flag, provide the post processing smoothing kernel used
--voxnumb	Number of voxels in a volume of n cubic mm, if voxel size is other than 1mm^3 
		For example: if voxel size is 2x2x2 (8mm^3) and volume is 
		1,000,000mm^3, voxnum=125,000 (1,000,000/8)
-v/--voxel	Use RFT-based voxel-wise rather than cluster-wise thresholding (Cao & Worsley, 1999)
--fence		Set absolute value upper (pos vals)/lower (neg vals) threshold for 
		calculation of volume of significant voxels in mcc_rft_info.txt file (default: 8)


Direction of desired statistic values: 
-n/--neg	Use only negative z/t scores
-p/--pos	Use only positive z/t scores
-b/--both	Create outputs for both positive and negative z/t scores (default)

--examples	Display usage examples
--version	Print version number of program and abort
--nolog		Print and delete mcc_rft_info.txt file when complete
-c/--clobber	Overwrite existing files
-h/--help	Print summary of command-line options and abort

Usage: 	jmd_rft_mcc.sh [options] <input.mnc>
	jmd_rft_mcc.sh --help
'''

exit 0
}

#Short usage function
function shortusage() {
echo '''
Usage: 	jmd_rft_mcc.sh [options] <input.mnc>
	jmd_rft_mcc.sh --help
'''
exit 0
}

#Version function
function version() {
echo '''
Author: Jonathan DuBois
Date Modified: 4/1/2013
Version: 1.6.3

Changes:
Added fence option for volume of sig voxels calc in info file
Changed echo (Positive Number of Significant...) to (Number of Significant Positive...) for all pos and neg
Bug fix with --hrplus smoothing option
'''
exit 0
}

#Examples function
function examples() {
echo '''
--Cluster-based MCC for HRRT PET data with mask, no additional smoothing, and specific output 
jmd_rft_mcc.sh --hrrt -m /Volumes/VolumeA/subjects/subj1/classify/Grey_Matter_nlin.mnc -o /Users/userA/data/output/subj1/grey_matter_mask_mcc_out /Users/UserA/data/subj1/ztest_blur0/subj1_nlin_ctxnorm_zmap.mnc

--Volume-based MCC for HRRT PET data without mask. If you want to look at data in a small region but do not want to mask out all other data use the --volume option.
jmd_rft_mcc.sh --hrrt --volume 1000 -o /Users/userA/data/output/subj1/no_mask_mcc_out /Users/UserA/data/subj1/ztest_blur0/subj1_nlin_ctxnorm_zmap.mnc

--Cluster-based MCC for data other than 1mm isotropic voxels. 
jmd_rft_mcc.sh --voxnumb 125,000 --volume 1000000 -o /Users/userA/data/output/subj1/2mmIso_mcc_out /Users/UserA/data/subj1/ztest_blur0/subj1_nlin_2mmIso_zmap.mnc

--Cluster-based MCC for T-map
jmd_rft_mcc.sh --df 50 -m /Volumes/VolumeA/subjects/subj1/classify/Grey_Matter_nlin.mnc -o /Users/userA/data/output/subj1/grey_matter_mask_Tmap_mcc_out /Users/UserA/data/subj1/ztest_blur0/subj1_nlin_tmap.mnc
'''
exit 0
}

#If no calls made, print short usage
if [ $# -lt 1 ] ; then  
	shortusage
fi

#translate long options to short gnu-style options
for arg
	do
	delim=""
    case $arg in
		--both) args="${args}-b ";;
		--clobber) args="${args}-c ";;
		--df) args="${args}-d ";;
		--examples) args="${args}-e ";;
		--fence) args="${args}-f ";;
		--help) args="${args}-h ";;
		--voxnumb) args="${args}-j ";;
		--pval) args="${args}-k ";;
		--mask) args="${args}-m ";;
		--neg) args="${args}-n ";;
		--output) args="${args}-o ";;
		--pos) args="${args}-p ";;
		--volume) args="${args}-q ";;
		--nolog) args="${args}-r ";;
		--smooth) args="${args}-s ";;
		--hrrt) args="${args}-t ";;
		--hrplus) args="${args}-u ";;
		--voxel) args="${args}-v ";;
		--version) args="${args}-w ";;
		
		#pass through anything else. Do not modify
       *) [[ "${arg:0:1}" == "-" ]] || delim="\""
           args="${args}${delim}${arg}${delim} ";;
    esac
done

# reset the translated args
eval set -- $args

#---Assign variables
#Requires that each letter assigned above is in the getopts and opt lists. Options intended to be followed by an argument should be followed by a colon in the getopts list and "$OPTARG" in the opt list. 
while getopts "chvertubwpnq:s:k:d:o:f:m:j:" opt; do
	case $opt in
	
	b)
		both=both ;;
	c)
		clob=-clob ;;
	d)
		df=$OPTARG ;;
	f)
		fence=$OPTARG ;;
	m) 
		mask=$OPTARG ;;
	o) 
		out=$OPTARG ;;
	k) 
		pval=$OPTARG ;;
	s) 
		smooth=$OPTARG ;;
	j) 
		voxnumb=$OPTARG ;;
	t)
		hrrt=hrrt ;;
	u)
		hrplus=hrplus ;;
	v) 
		voxel=voxel ;;
	r) 
		nolog=nolog ;;
	q) 
		volume=$OPTARG ;;
	p)
		gt=gt ;;
	n)
		lt=lt ;;	
	
	h)	usage ;;
	
	e)	examples ;;
	
	w)	version ;;
	
	esac
done
shift $(( OPTIND - 1 ))

#----------Checks proper option usage and necessary arguements.
#If clobber is null, check if output files already exist 
if [ -z $clob ] && [ -e "$out/mcc_rft_info.txt" -o -e "$out/neg_thresh.mnc" -o -e "$out/pos_thresh.mnc" -o -e "$out/neg_mcc_map.mnc" -o -e "$out/pos_mcc_map.mnc" ] ; then
	echo "ERROR: Output files exist. Use --clobber to overwrite"
	echo "--help for usage"
	exit 5
fi

#P-value
if [ -n "$pval" ] ; then 
	if [ $(bc <<< "$pval <= 0") -eq 1 ] || [ $(bc <<< "$pval >= 1") -eq 1 ]; then
		echo "ERROR: P-value out of bounds!"
		echo "--help for usage"
		exit 5
	fi
fi
if [ -z "$pval" ] ; then
	pval=0.05
fi

#Degrees of freedom
if [ -n "$df" ] ; then 
	if ! [[ "$df" =~ ^[0-99]+$ ]] ; then
		echo "ERROR: degrees of freedom not specified!"
		echo "--help for usage"
		exit 5
	fi
fi
if [ -z "$df" ] ; then
	df=Inf
fi

#PET Scanner
if [ -n "$hrrt" -a -n "$hrplus" ] ; then
	echo "ERROR: Must specify one PET scanner!"
	echo "--help for usage"
	exit 5
fi
if [ -n "$hrrt" ] ; then
	res=2.5
fi
if [ -n "$hrplus" ] ; then
	res=6
fi

#Smoothing
#if [ -n "$smooth" ] ; then 
#	if [[ "$smooth" !=~ ^[0-40]+$ ]] ; then
#		echo "ERROR: Smoothing kernel not specified or out of bounds!"
#		echo "--help for usage"
#		exit 5
#	fi
#fi

#Set total smoothing
if [ -n "$smooth" ] && [ -n "$hrrt" -o -n "$hrplus" ] ; then
	tSM=`echo "scale=5;sqrt($res^2 + $smooth^2)" | bc`
elif [ -z "$smooth" ] && [ -n "$hrrt" -o -n "$hrplus" ] ; then
	tSM=$res
elif [ -z "$smooth" ] && [ -z "$hrrt" ] && [ -z "$hrplus" ] ; then
	tSM=1
elif [ -n "$smooth" ] && [ -z "$hrrt" ] && [ -z "$hrplus" ] ; then
	tSM=$smooth
fi


#Voxel Number
#if [ -n "$voxnumb" ] ; then 
#	if [[ "$voxnumb" =~ ^[0-5000000]+$ ]] ; then
#		echo "ERROR: Number of voxels not specified!"
#		echo "--help for usage"
#		exit 5
#	fi
#fi
if [ -z "$voxnumb" ] ; then
	voxnumb=1500000
fi

#Output
if [ -n "$out" ] && [ ! -d "$out" ] ; then
	echo "ERROR: $out does not exist!"
	exit 5
fi
if [ -z "$out" ] ; then
	out=$(pwd)
fi
echo "Output Directory: $out" >> ${out}/mcc_rft_info.txt

#Input
input=$@
n=$#
if [ $n -gt 1 ] ; then
	echo "ERROR: Only one input file allowed: $input"
	echo "--help for usage"
	exit 5
fi
if [ -e ${out}/mcc_rft_info.txt ] ; then
	rm ${out}/mcc_rft_info.txt
fi
if [ ! -e $input ] ; then
	echo "ERROR: $input does not exist!"
	exit 5
else
	echo "Input file: $input" >> ${out}/mcc_rft_info.txt
fi

#Test direction
if [ -n "$lt" -a -n "$gt" ] || [ -n "$lt" -a -n "$both" ] || [ -n "$gt" -a -n "$both" ] ; then
	echo "ERROR: Only one directional option accepted!"
	echo "--help for usage"
	exit 5
fi

if [ -n "$lt" ] ; then
	abs=lt
else
	abs=gt
fi

#Fence Threshold
if [ -n "$fence" ] ; then
	pos_fnc=$fence
	neg_fnc=`echo "$fence*-1" | bc`
else
	pos_fnc=8
	neg_fnc=-8
fi

#Mask
if [ -n "$mask" ] ; then
	if [ ! -e $mask ] ; then
		echo "ERROR: $mask does not exist!";
		exit 5
	else
		echo "Mask: $mask" >> ${out}/mcc_rft_info.txt
	fi
fi

#Search Volume
if [ -n "$mask" -a -z "$volume" ] ; then
	mincstats $mask -binvalue 1 -volume -quiet | while read maskvolume ; do
		echo $maskvolume >> ${out}/mask_volume_temp.txt
	done
	mask_volume=$(<${out}/mask_volume_temp.txt)
	vol=`echo "tmp=$mask_volume; tmp /= 1; tmp" | bc`
elif [ -n "$mask" -a -n "$volume" ] ; then
	vol=$volume
elif [ -z "$mask" -a -n "$volume" ] ; then
	vol=$volume
elif [ -z "$mask" -a -z "$volume" ] ; then
	vol=1500000
fi
echo "Search Volume: $vol" >> ${out}/mcc_rft_info.txt
echo "P-Value: $pval" >> ${out}/mcc_rft_info.txt
echo "Cumulative Smoothing: ${tSM}mm FWHM" >> ${out}/mcc_rft_info.txt

#------------------------ANALYSIS----------------------------
#Voxel-wise Analysis
if [ -n "$voxel" ] ; then
	echo Starting voxel-wise analysis
	echo "Voxel-wise analysis" >> ${out}/mcc_rft_info.txt
	
	#Pass parameters for MCC to Matlab
	echo "diary('${out}/matlab_temp.txt'); addpath(genpath('/home/wang/Documents/MATLAB/fmristat/')); stat_threshold(${vol},${voxnumb},${tSM},${df},${pval}); diary off; exit;" > mat_input_temp.m
	/opt/matlab12b/bin/matlab -nodesktop -nosplash -r mat_input_temp;
	
	#Textfile Kungfu
	grep -A 2 peak_threshold ${out}/matlab_temp.txt >> ${out}/matlabk1_temp.txt
	grep -v 'threshold' ${out}/matlabk1_temp.txt > ${out}/matlabk2_temp.txt
	perl -pe 's/^\s+//' ${out}/matlabk2_temp.txt > ${out}/matlabk3_temp.txt
	head -1 ${out}/matlabk3_temp.txt > ${out}/cc_out_head_temp.txt
	cthresh=$(<${out}/cc_out_head_temp.txt)
	
	#Set thresholds based on Matlab output
	if [ -n "$lt" ] ; then
		ct=`echo "$cthresh*-1" | bc`
	else
		ct=$cthresh
	fi
	
	#Threshold input
	mincmath -$abs -const $ct ${input} ${out}/cthresh_temp.mnc $clob
	if [ -n "$lt" ] ; then
		echo "Fencing Threshold: $pos_fnc/$neg_fnc" >> ${out}/mcc_rft_info.txt
		echo "Negative Threshold: $ct" >> ${out}/mcc_rft_info.txt
		mincmath -mult ${out}/cthresh_temp.mnc ${input} ${out}/neg_thresh.mnc $clob
		mincstats -quiet -volume -ceil $ct -floor $neg_fnc ${out}/neg_thresh.mnc | while read sigvolt ; do
			echo "Number of Significant Negative Voxels: $sigvolt" >> ${out}/mcc_rft_info.txt 
		done
	else
		echo "Fencing Threshold: $pos_fnc/$neg_fnc" >> ${out}/mcc_rft_info.txt
		echo "Positive Threshold: $ct" >> ${out}/mcc_rft_info.txt
		mincmath -mult ${out}/cthresh_temp.mnc ${input} ${out}/pos_thresh.mnc $clob
		mincstats -quiet -volume -floor $ct -ceil $pos_fnc ${out}/pos_thresh.mnc | while read sigvolt ; do
			echo "Number of Significant Positive Voxels: $sigvolt" >> ${out}/mcc_rft_info.txt 
		done
	fi
	
	#Masking data outside of search region & calculating significant voxels
	if [ -n "$mask" ] ; then
		if [ -n "$lt" ] ; then
			mincmath -mult ${out}/neg_thresh.mnc $mask ${out}/neg_mcc_map.mnc $clob
			mincstats -quiet -volume -floor $neg_fnc -ceil $ct ${out}/neg_mcc_map.mnc | while read sigvolm ; do
				echo "Number of Significant Negative Voxels within mask: $sigvolm" >> ${out}/mcc_rft_info.txt 
			done
		else
			mincmath -mult ${out}/pos_thresh.mnc $mask ${out}/pos_mcc_map.mnc $clob
			mincstats -quiet -volume -floor $ct -ceil $pos_fnc ${out}/pos_mcc_map.mnc | while read sigvolm ; do
				echo "Number of Significant Positive Voxels within mask: $sigvolm" >> ${out}/mcc_rft_info.txt 
			done
		fi
	fi
	cat ${out}/mcc_rft_info.txt
	rm ${out}/*temp.txt
	rm ${out}/*temp.mnc
	rm mat_input_temp.m
else

#Cluster-wise Analysis
	echo Starting cluster-wise analysis
	echo "Cluster-wise analysis" >> ${out}/mcc_rft_info.txt
	
	#Pass parameters for MCC to matlab
	echo "diary('${out}/matlab_temp.txt'); addpath(genpath('/home/wang/Documents/MATLAB/fmristat/')); stat_threshold(${vol},${voxnumb},${tSM},${df},${pval}); diary off; exit;" > mat_input_temp.m
	/opt/matlab12b/bin/matlab -nodesktop -nosplash -r mat_input_temp;
	
	#Textfile Kungfu
	grep -A 2 Cluster_threshold ${out}/matlab_temp.txt >> ${out}/matlabk1_temp.txt
	grep -A 2 'extent_threshold =' ${out}/matlab_temp.txt >> ${out}/matlabk1_temp.txt
	grep -v 'threshold' ${out}/matlabk1_temp.txt > ${out}/matlabk2_temp.txt
	perl -pe 's/^\s+//' ${out}/matlabk2_temp.txt > ${out}/matlabk3_temp.txt
	head -1 ${out}/matlabk3_temp.txt > ${out}/cc_out_head_temp.txt
	tail -1 ${out}/matlabk3_temp.txt > ${out}/cc_out_tail_temp.txt
	cthresh=$(<${out}/cc_out_head_temp.txt)
	csize=$(<${out}/cc_out_tail_temp.txt)
	
	#Set cluster correction threshold and size based on matlab output
	if [ $vol -lt 10000 ] ; then
		cs=30
	else
		cs=`printf '%.0f\n' $csize`
		#cs=`echo "tmp=$csize; tmp /= 1; tmp" | bc`
	fi
	
	if [ -n "$lt" ] ; then
		ct=`echo "$cthresh*-1" | bc`
	else
		ct=$cthresh
	fi
	
	#Mask input
	if [ -n "$mask" ] ; then
		mincmath -mult $input $mask ${out}/map_temp.mnc $clob
	else
		cp $input ${out}/map_temp.mnc
	fi
	
	#Threshold input
	mincmath -$abs -const $ct ${out}/map_temp.mnc ${out}/cthresh_temp.mnc $clob
	mincmath -mult ${out}/cthresh_temp.mnc ${input} ${out}/input_thresh_temp.mnc $clob
	
	#Determine cluster volumes
	mincmorph -group -3D06 ${out}/cthresh_temp.mnc ${out}/clusters_temp.mnc $clob
	mincstats -histogram ${out}/hist_temp.txt -discrete_histogram ${out}/clusters_temp.mnc
	grep -v '[[:space:]][[:space:]][[:space:]][[:space:]]*0' ${out}/hist_temp.txt > ${out}/histk_temp.txt
	grep -v '#' ${out}/histk_temp.txt >> ${out}/histk2_temp.txt
	while read line ; do
		while read alpha beta ; do
			for b in $beta ; do
				for a in $alpha ; do
					if [ "$b" -ge "$cs" ] ; then
						echo $a > ${out}/histk3_temp.txt
					fi
				done
			done
		done
	done < ${out}/histk2_temp.txt
	
	#Echo thresholds and clusters to log file
	if [ -n "$lt" ] ; then
		echo "Fencing Threshold: $pos_fnc/$neg_fnc" >> ${out}/mcc_rft_info.txt
		echo "Negative Threshold: $ct" >> ${out}/mcc_rft_info.txt
	else
		echo "Fencing Threshold: $pos_fnc/$neg_fnc" >> ${out}/mcc_rft_info.txt
		echo "Positive Threshold: $ct" >> ${out}/mcc_rft_info.txt
	fi
	echo "Min Cluster Volume: ${cs}mm^3" >> ${out}/mcc_rft_info.txt
	if [ ! -e ${out}/histk3_temp.txt ] ; then
		cn=0
		if [ -n "$lt" ] ; then
			echo "Number of Significant Negative Clusters: $cn" >> ${out}/mcc_rft_info.txt
			echo "Number of Significant Negative Voxels within mask: $cn" >> ${out}/mcc_rft_info.txt
		else
			echo "Number of Significant Positive Clusters: $cn" >> ${out}/mcc_rft_info.txt
			echo "Number of Significant Positive Voxels within mask: $cn" >> ${out}/mcc_rft_info.txt
		fi
	else
		tail -1 ${out}/histk3_temp.txt > ${out}/histk4_temp.txt
		limit=$(<${out}/histk4_temp.txt)
		cnum=`echo "$limit + .3" | bc`
		
		#---Masking out clusters below threshold
		cn=`echo "tmp=$cnum; tmp /= 1; tmp" | bc`
		mincmath -lt -const $cnum ${out}/clusters_temp.mnc ${out}/cluster_mask_temp.mnc $clob
		if [ -n "$lt" ] ; then
			mincmath -mult ${out}/input_thresh_temp.mnc ${out}/cluster_mask_temp.mnc ${out}/neg_mcc_map.mnc $clob
			mincstats -quiet -volume -floor $neg_fnc -ceil $ct ${out}/neg_mcc_map.mnc | while read sigvolm ; do
				echo "Number of Significant Negative Clusters: $cn" >> ${out}/mcc_rft_info.txt
				echo "Number of Significant Negative Voxels within mask: $sigvolm" >> ${out}/mcc_rft_info.txt
			done
		else
			mincmath -mult ${out}/input_thresh_temp.mnc ${out}/cluster_mask_temp.mnc ${out}/pos_mcc_map.mnc $clob
			mincstats -quiet -volume -floor $ct -ceil $pos_fnc ${out}/pos_mcc_map.mnc | while read sigvolm ; do
				echo "Number of Significant Positive Clusters: $cn" >> ${out}/mcc_rft_info.txt
				echo "Number of Significant Positive Voxels within mask: $sigvolm" >> ${out}/mcc_rft_info.txt
			done
		fi
		
	fi
	cat ${out}/mcc_rft_info.txt
	rm ${out}/*temp.txt
	rm ${out}/*temp.mnc
	rm mat_input_temp.m
fi

#Step 2 of Bi-directional correction
if [ -n "$both" ] || [ -z "$lt" -a -z "$gt" -a -z "$both" ] ; then
	
	abs=lt
	ct=`echo "$cthresh*-1" | bc`
	
	#Voxel-wise
	if [ -n "$voxel" ] ; then
		
		#---Threshold input
		echo "Negative Threshold: $ct" >> ${out}/mcc_rft_info.txt
		mincmath -$abs -const $ct ${input} ${out}/cthresh_temp.mnc $clob
		mincmath -mult ${out}/cthresh_temp.mnc ${input} ${out}/neg_thresh.mnc $clob
		mincstats -quiet -volume -floor $neg_fnc -ceil $ct ${out}/neg_thresh.mnc | while read sigvolt ; do
			echo "Number of Significant Negative Voxels: $sigvolt" >> ${out}/mcc_rft_info.txt 
		done
		
		#---Masking out data outside of search region
		if [ -n "$mask" ] ; then
			mincmath -mult ${out}/neg_thresh.mnc $mask ${out}/neg_mcc_map.mnc $clob
			mincstats -quiet -volume -floor $neg_fnc -ceil $ct ${out}/neg_mcc_map.mnc | while read sigvolm ; do
				echo "Number of Significant Negative Voxels within mask: $sigvolm" >> ${out}/mcc_rft_info.txt
			done
		fi
		cat ${out}/mcc_rft_info.txt
		rm ${out}/*temp.mnc
	else
	
	#Cluster-wise
		#Mask input
		if [ -n "$mask" ] ; then
			mincmath -mult $input $mask ${out}/map_temp.mnc $clob
		else
			cp $input ${out}/map_temp.mnc
		fi
		
		#Threshold input
		mincmath -$abs -const $ct ${out}/map_temp.mnc ${out}/cthresh_temp.mnc $clob
		mincmath -mult ${out}/cthresh_temp.mnc ${input} ${out}/input_thresh_temp.mnc $clob
		
		#Determine cluster volumes
		mincmorph -group -3D06 ${out}/cthresh_temp.mnc ${out}/clusters_temp.mnc $clob
		mincstats -histogram ${out}/hist_temp.txt -discrete_histogram ${out}/clusters_temp.mnc
		grep -v '[[:space:]][[:space:]][[:space:]][[:space:]]*0' ${out}/hist_temp.txt > ${out}/histk_temp.txt
		grep -v '#' ${out}/histk_temp.txt >> ${out}/histk2_temp.txt
		while read line ; do
			while read alpha beta ; do
				for b in $beta ; do
					for a in $alpha ; do
						if [ "$b" -ge "$cs" ] ; then
							echo $a > ${out}/histk3_temp.txt
						fi
					done
				done
			done
		done < ${out}/histk2_temp.txt
		
		#Echo thresholds and clusters to log file
		echo "Negative Threshold: $ct" >> ${out}/mcc_rft_info.txt
		echo "Min Cluster Volume: ${cs}mm^3" >> ${out}/mcc_rft_info.txt
		if [ ! -e ${out}/histk3_temp.txt ] ; then
			cn=0
			echo "Number of Significant Negative Clusters: $cn" >> ${out}/mcc_rft_info.txt
			echo "Number of Significant Negative Voxels within mask: $cn" >> ${out}/mcc_rft_info.txt
		else
			tail -1 ${out}/histk3_temp.txt > ${out}/histk4_temp.txt
			limit=$(<${out}/histk4_temp.txt)
			cnum=`echo "$limit + .3" | bc`
			
			#---Masking out clusters below threshold
			cn=`echo "tmp=$cnum; tmp /= 1; tmp" | bc`
			echo "Number of Significant Negative Clusters: $cn" >> ${out}/mcc_rft_info.txt
			mincmath -lt -const $cnum ${out}/clusters_temp.mnc ${out}/cluster_mask_temp.mnc $clob
			mincmath -mult ${out}/input_thresh_temp.mnc ${out}/cluster_mask_temp.mnc ${out}/neg_mcc_map.mnc $clob
			mincstats -quiet -volume -floor $neg_fnc -ceil $ct ${out}/neg_mcc_map.mnc | while read sigvolm ; do
				echo "Number of Significant Negative Voxels within mask: $sigvolm" >> ${out}/mcc_rft_info.txt
			done
		fi	
		cat ${out}/mcc_rft_info.txt
		rm ${out}/*temp.txt
		rm ${out}/*temp.mnc
	fi
fi
if [ -n "$nolog" ] ; then
	rm ${out}/mcc_rft_info.txt
fi
echo finished

###--TO-DO:
#
# error check for non-binary masks
# usage of resel in stat_threshold
