#!/bin/sh

if [ $# -lt 2 ]; then echo "Usage: $0 fileWithDesiredTests files"; exit; fi
	#threshold="-ceil 100 -floor 3.5"
	#mask="-mask something -mask_binvalue 1"
	#whatUwant="-volume -mean -stddev"
	testFile="$1"; shift
while [ -f "$1" ]; do
	subj=`basename $1 | sed "s:subject\([0-9]\{3,4\}\).*:\1:"`
	sess=`basename $1 | sed "s:.*session\([0-9]*\).*:\1:"`
	echo -n "$subj,$sess"
	cat $testFile |
	while read test; do
		stat=`mincstats -quiet $test $1`
		stat=`echo $stat | tr -d '\r'`
		echo -n ",$stat"
	done
		echo ""
	shift
done
