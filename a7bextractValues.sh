#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 files fileWithDesiredTests"; exit; fi
	#threshold="-ceil 100 -floor 3.5"
	#mask="-mask something -mask_binvalue 1"
	#whatUwant="-volume -mean -stddev"
for i in $1; do
	subj=`echo $i | sed "s:\([0-9]\{3,4\}\).*:\1:1"`
	sess=`echo $i | sed "s:sess\([0-9]*\).*:\1:"`
	testsData=""
	cat $2 |
	while read test; do
		stat=`mincstats -quiet $test $i`
		testsData=" $stat"
	done
	echo $subj $sess $testsData
done
fi