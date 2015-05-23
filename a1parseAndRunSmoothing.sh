#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <inputFolder (/data/data03/wang/input/20150119_mcsa/preprocessing/fmri/)>"; exit; fi

outputFolder="$2/../fmri_s/"
mkdir -p $outputFolder
for input_file in `ls $2/*.mnc*`; do
	output_file=`echo ${input_file} | sed "s:fmri/:fmri_s/:"`
	if [ -f "${output_file}" ]; then continue; fi
	echo ${output_file}
	subjectID=`echo ${input_file} | sed "s:.*fmri_\(subject[0-9]\{4\}\)_.*:\1:"`
	temp_file="/tmp/${RANDOM}_smoothing.txt"
	echo "smoothFmri('${input_file}','${output_file}','$outputFolder',6)" >> ${temp_file}
	~/Documents/bin/fMRIStat/runMatlabList.sh "$1" "${temp_file}"
	rm ${temp_file}
done
