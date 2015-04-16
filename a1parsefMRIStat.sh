#!/bin/sh

names=(lA lM lP rA rM rP PCC)
x=(-28 -28 -28 28 28 28 0)
y=(-16 -27 -37 -16 -27 -37 -53)
z=(-20 -13 -4 -20 -13 -4 -26)

if [ $# -ne 1 ]; then echo "Usage: $0 <inputFolder (/data/data03/wang/input/20150119_mcsa/preprocessing/fmri_s/)>"; exit; fi

input="$1"
for i in `ls $input/*.mnc`; do
	for ((j = 0; j < 7; j++)); do # Number of seeds to test
		output=$input/../../fMRIStat/${names[j]}/data/
		info=`echo $i | sed "s:.*subject:subject:" | sed "s:\.mnc*::"`
		unsmoothed=`echo $i | sed "s:/fmri_s/:/fmri/:"`
		mkdir -p $output
		echo "runFmrilm('$i','$unsmoothed','$output/$info','${names[j]}',${x[j]},${y[j]},${z[j]});"
	done
done
