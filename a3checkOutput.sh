#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <logFile>"; exit; fi

for i in `cat "$2"`; do
	fileLocation=`echo $i | sed "s/:.*//"`
	matlabScript=`echo $i | sed "s/.*://"`
	if [ ! -f "$fileLocation" ]; then
		echo -n "$matlabScript "
		runToQsub.sh "$1" "$matlabScript"
	fi
done
