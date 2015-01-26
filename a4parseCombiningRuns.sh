#!/bin/sh

if [ $# -ne 1 ]; then echo "Usage: $0 <inputFolder (/data/data03/wang/input/20150119_mcsa/fMRIStat/)>"; exit; fi

for j in `ls ${1}`; do
	inputFolder="${1}/${j}/"
	tempFile="/tmp/parse_${RANDOM}.txt"
	mkdir -p $inputFolder/data2/
	for i in `ls $inputFolder/data/*_mag_t.mnc`; do
		subject=`basename $i | sed "s:subject::" | sed "s:_.*::"`
		session=`basename $i | sed "s:.*session::" | sed "s:_.*::"`
		echo "combiningRuns('$inputFolder','$subject','$session');" >> $tempFile
	done

	cat $tempFile | sort -u
	rm $tempFile
done
