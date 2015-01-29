
function determineDF () {
	df
	case "$i"
		*mcsa*)
	
		;;
		*adni*)
		
		;;
	esac
}

for i in `ls /data/data03/wang/output2/*.mnc`; do
	determineDF
	runRFT.sh <file> <smoothing> <degrees of freedom>
done
