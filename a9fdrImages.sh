#!/bin/sh

if [ $# -ne 1 -a $# -ne 2 ]; then echo "Usage: $0 <file> (maskFile)"; exit; fi

if [ -n "$2" ]; then mask="$2"; else mask="/data/data03/wang/input/20140805_ADNI/fMRIStat/resampledMask.mnc"; fi

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
determineDF
fdr_threshold --twosided --independent --clobber --mask "$mask" "$1" "$df" 0.05 mask.mnc
mincmask -clobber "$1" mask.mnc ${i}_fdr.mnc
rm mask.mnc
