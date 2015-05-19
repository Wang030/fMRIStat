#!/bin/sh

if [ $# -ne 4 -a $# -ne 5 ]; then echo "Usage: $0 <file> <smoothing> <degrees of freedom> <outputFolder> (maskFile)"; exit; fi

if [ -n "$5" ]; then mask="$5"; else mask="/data/data03/wang/input/20140805_ADNI/fMRIStat/resampledMask.mnc"; fi

numberOfVoxels=`mincstats -mask $mask -mask_binvalue 1 -quiet -count $1`
sh /home/wang/Documents/bin/fMRIStat/johnRft.sh -m $mask -c -d $3 -s $2 --voxnumb $numberOfVoxels -o $4 $1
