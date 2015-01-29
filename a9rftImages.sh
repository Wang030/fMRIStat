function determineDF () {
	df=0
	case "$i" in
		*adni*)
		case "$i" in
			*1*)
				df=`expr $df + 60`;;
			*2*)
				df=`expr $df + 53`;;
			*3*)
				df=`expr $df + 40`;;
			*4*)
				df=`expr $df + 37`;;
		esac
		;;
		*mcsa*)
		case "$i" in
			*1*)
				df=`expr $df + 17`;;
			*3*)
				df=`expr $df + 12`;;
			*4*)
				df=`expr $df + 9`;;
		esac
		;;
	esac
	df=`expr $df - 2`;
}

for i in `ls /data/data03/wang/output2/*.mnc`; do
	determineDF
	echo $i $df
	#runRFT.sh $i 6 "$df"
done
