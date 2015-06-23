#!/bin/sh

if [ $# -lt 1 ]; then echo "Usage: $0 <mincFile> (maskFile) (degrees of freedom)"; exit; fi

if [ -n "$2" ]; then mask="$2"; else mask="/data/data03/wang/input/20140805_ADNI/fMRIStat/resampledMask.mnc"; fi

function determineDF () {
	df=0
	if grep -q "adni" <<< "$i"; then
		if grep -q "1" <<< "$i"; then df=`expr $df + 56`; fi
		if grep -q "2" <<< "$i"; then df=`expr $df + 48`; fi
		if grep -q "3" <<< "$i"; then df=`expr $df + 35`; fi
		if grep -q "4" <<< "$i"; then df=`expr $df + 31`; fi
	elif grep -q "mcsa" <<< "$i"; then
		if grep -q "1" <<< "$i"; then df=`expr $df + 17`; fi
		if grep -q "3" <<< "$i"; then df=`expr $df + 12`; fi
		if grep -q "4" <<< "$i"; then df=`expr $df + 9`; fi
		if grep -q "6" <<< "$i"; then df=`expr $df + 10`; fi
	fi
	df=`expr $df - 2`;
}

i=`basename $1 .mnc`
output=`dirname $1`/$i
mkdir -p "$output"
determineDF
if [ "$df" -eq "-2" ]; then df="$3"; fi
runRFT.sh $1 6 "$df" "$output" "$2"
