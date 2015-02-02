#!/bin/sh

if [ $# -ne 1 ]; then echo "Usage: $0 <mincFile>"; exit; fi

function determineDF () {
	df=0
	if grep -q "adni" <<< "$i"; then
		if grep -q "1" <<< "$i"; then df=`expr $df + 60`; fi
		if grep -q "2" <<< "$i"; then df=`expr $df + 53`; fi
		if grep -q "3" <<< "$i"; then df=`expr $df + 40`; fi
		if grep -q "4" <<< "$i"; then df=`expr $df + 37`; fi
	elif grep -q "mcsa" <<< "$i"; then
		if grep -q "1" <<< "$i"; then df=`expr $df + 17`; fi
		if grep -q "3" <<< "$i"; then df=`expr $df + 12`; fi
		if grep -q "4" <<< "$i"; then df=`expr $df + 9`; fi
	fi
	df=`expr $df - 2`;
}

i=`basename $1 .mnc`
output=`dirname $1`/$i
mkdir -p "$output"
determineDF
runRFT.sh $1 6 "$df" "$output"
