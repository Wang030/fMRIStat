#!/bin/sh

if [ $# -ne 3 ]; then echo "Usage: $0 <scriptLocation> <inputFolder (/data/data03/wang/input/20150119_mcsa/preprocessing/fmri/)> outputFolder"; exit; fi

mkdir -p $3
for input_file in `ls $2/*.mnc*`; do
	output_file="${input_file}/../fmri_s/`basename ${input_file}`
	if [ -f ${output_file} ]; then continue; fi
	subjectID=`echo ${input_file} | sed "s:.*fmri_\(subject[0-9]\{4\}\)_.*:\1:"`
	temp_file="/tmp/${RANDOM}_smoothing.txt"
	echo "smoothFmri('${input_file}','${output_file}','$3',6)" > ${temp_file}
	for i in `cat ${temp_file}`; do runToQsub.sh "$1" "$i"; done
	rm ${temp_file}
done
