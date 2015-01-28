#!/bin/sh

if [ $# -ne 3 ]; then echo "Usage: $0 <scriptLocation> <text with list of matlab commands> <outputFile>"; exit; fi

if  [ -f "$3" ]; then rm "$3"; fi
for i in `cat $2`; do
	outputFile=`echo $i | sed "s:combiningRuns('::" | sed "s:',':data2/subject:" | sed "s:',':_session:" | sed "s:');:_multi_t.mnc:"`
	echo "${outputFile}:$i" >> $3
	runToQsub.sh "$1" "$i"
done
