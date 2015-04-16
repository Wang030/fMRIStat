#!/bin/sh

if [ $# -ne 3 ]; then echo "Usage: $0 <scriptLocation> <inputFolder (/data/data03/wang/input/20150119_mcsa/preprocessing/fmri/)> outputFolder"; exit; fi

mkdir -p $outputFolder
for input_file in `ls $2/*.mnc*`; do
	subjectID=`echo ${input_file} | sed "s:.*fmri_\(subject[0-9]\{4\}\)_.*:\1:"`
	#input_mask=`ls $2/../anat/${subjectID}/func_*_mask_stereonl.mnc*`
	temp_file="/tmp/${RANDOM}_smoothing.txt"
	#echo "smoothFmri({'${input_file}','${input_mask}'},'$outputFolder',6)" > ${temp_file}
	echo "smoothFmri('${input_file}','$outputFolder',6)" > ${temp_file}
	for i in `cat ${temp_file}`; do runToQsub.sh "$1" "$i"; done
	rm ${temp_file}
done
