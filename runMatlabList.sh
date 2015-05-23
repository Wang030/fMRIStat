#!/bin/sh

#Same as 3checkOutput.sh
if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <list of matlab commands>"; exit; fi

for i in `cat "$2"`; do
	if [[ $i == *":"* ]]; then
		fileLocation=`echo $i | sed "s/:.*//"`
		matlabScript=`echo $i | sed "s/.*://"`
	else
		fileLocation="somethingThatWillNeverNeverEverExistAsFile.txt"
		matlabScript=$i
	fi
	if [ ! -f "$fileLocation" ]; then
		echo -n "$matlabScript "
		~/Documents/bin/fMRIStat/runMatlabScript.sh "$1" "$matlabScript"
	fi
done
