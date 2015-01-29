#!/bin/sh

if [ $# -ne 3 ]; then echo "Usage: $0 <file> <smoothing> <degrees of freedom>"; exit; fi

mask="/data/data03/wang/input/20140805_ADNI/fMRIStat/resampledMask.mnc"
numberOfVoxels=`mincstats -mask $mask -mask_binvalue 1 -quiet -count $1`
sh /home/wang/Documents/bin/fMRIStat/johnRft.sh -m /data/data03/wang/input/20140805_ADNI/fMRIStat/resampledMask.mnc -d $3 -s $2 --voxnumb $numberOfVoxels $1
