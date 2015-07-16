#!/bin/sh

if [ $# -ne 1 ]; then echo "Usage: $0 <inputLocationFolder>"; exit; fi

function press() {
	echo -n "$i `basename $mask` "
}

for i in `ls $1/*_t.mnc`; do
	for mask in /data/data03/wang/input/20150119_ADNI/masks/readyMask_gm.mnc /data/data03/wang/input/20150119_ADNI/masks/readyMask_hippocampus_both.mnc /data/data03/wang/input/20150119_ADNI/masks/readyMask_hippocampus_left.mnc /data/data03/wang/input/20150119_ADNI/masks/readyMask_hippocampus_right.mnc /data/data03/wang/input/20150119_ADNI/masks/conjunctionAnalysis/cnOverlap_hipp_left_re.mnc /data/data03/wang/input/20150119_ADNI/masks/conjunctionAnalysis/cnOverlap_hipp_right_re.mnc /data/data03/wang/input/20150119_ADNI/masks/conjunctionAnalysis/cnOverlap_hipp_total_re.mnc; do
	press; echo "volume2 `mincstats -mask $mask -mask_binvalue 1 -quiet -floor 2 -volume $i`"
	press; echo "volume25 `mincstats -mask $mask -mask_binvalue 1 -quiet -floor 2.5 -volume $i`"
	press; echo "volume3 `mincstats -mask $mask -mask_binvalue 1 -quiet -floor 3 -volume $i`"
	press; echo "volume35 `mincstats -mask $mask -mask_binvalue 1 -quiet -floor 3.5 -volume $i`"
	press; echo "volume4 `mincstats -mask $mask -mask_binvalue 1 -quiet -floor 4 -volume $i`"
	press; echo "mean `mincstats -mask $mask -mask_binvalue 1 -quiet -ceil 20 -mean $i`"
	press; echo "stddev `mincstats -mask $mask -mask_binvalue 1 -quiet -ceil 20 -stddev $i`"
done; done
