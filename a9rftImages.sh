function determineDF () {
	df=0
	if grep -q "adni" <<< "$i"; then
		if grep -q "1" <<< "$i"; then df=`expr $df + 60`;;
		if grep -q "2" <<< "$i"; then df=`expr $df + 53`;;
		if grep -q "3" <<< "$i"; then df=`expr $df + 40`;;
		if grep -q "4" <<< "$i"; then df=`expr $df + 37`;;
	elif grep -q "mcsa" <<< "$i"; then
		if grep -q "1" <<< "$i"; then df=`expr $df + 17`;;
		if grep -q "3" <<< "$i"; then df=`expr $df + 12`;;
		if grep -q "4" <<< "$i"; then df=`expr $df + 9`;;	
	fi
	df=`expr $df - 2`;
}

for i in `ls /data/data03/wang/output2/*.mnc`; do
	determineDF
	echo $i $df
	#runRFT.sh $i 6 "$df"
done
