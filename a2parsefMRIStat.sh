#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <seeds csvFile> <inputFolder (/data/data03/wang/input/20150119_mcsa/preprocessing/fmri_s/)>"; exit; fi

input="$2"
cat $1 | while IFS="," read names x y z; do
for i in `ls $input/*.mnc`; do
		output=$input/../../fMRIStat/${names}/data/
		info=`echo $i | sed "s:.*subject:subject:" | sed "s:\.mnc*::"`
		unsmoothed=`echo $i | sed "s:/fmri_s/:/fmri/:"`
		mkdir -p $output
		matlabCommand="runFmrilm('$i','$unsmoothed','$output/$info','${names}',${x},${y},${z},[],[],[]);"
		outputFile=`echo $matlabCommand | sed "s:.*'/data:/data:" | sed "s:'.*::1"`
		echo "${outputFile}_mag_t.mnc:$matlabCommand"
done
done
