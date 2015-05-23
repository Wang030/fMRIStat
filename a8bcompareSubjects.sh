#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <matFile>"; exit; fi

matlabScript="compareSubjects(group1_files,group2_files,group1_covariates,group2_covariates,outputBase);"
outputFile=`echo $2 | sed "s:mat:mnc:"`
~/Documents/bin/fMRIStat/runMatlabScript.sh "$1" "$matlabScript" "$2"
