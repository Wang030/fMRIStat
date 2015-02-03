#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <matFile>"; exit; fi

matlabScript="combiningSubjects(outputBase,group_t,fwhm_varatio);"
runToQsub.sh "$1" "$matlabScript" "$2"
