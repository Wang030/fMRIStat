#!/bin/sh

if [ $# -ne 3 ]; then echo "Usage: $0 <scriptLocation> <matFile> <logFile>"; exit; fi

matlabScript="runMultistat(group1_files, group2_files, group1_covariates, group2_covariates, outputBase);"
outputFile=`echo $2 | sed "s:mat:mnc:"`
echo "${outputFile}:$2" >> $3
runToQsub.sh "$1" "$matlabScript" "$2"