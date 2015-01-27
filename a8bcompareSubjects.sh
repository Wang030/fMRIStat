#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <matFile>"; exit; fi

matlabScript="runMultistat(group1_files, group2_files, group1_covariates, group2_covariates, outputBase);"
runToQsub.sh "$1" "$matlabScript" "$2"