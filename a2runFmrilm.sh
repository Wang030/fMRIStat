#!/bin/sh

if [ $# -ne 3 ]; then echo "Usage: $0 <scriptLocation> <text with list of matlab commands> <outputFile>"; exit; fi

for i in `cat $2`; do
	outputFile=`echo $i | sed "s:.*'/data:/data:" | sed "s:'.*::1"`
	echo "${outputFile}_mag_t.mnc:$i" >> $3
	runToQsub.sh "$1" "$i"
done
