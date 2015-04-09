#!/bin/sh
unset R_LIBS
source /opt/minc-toolkit/minc-toolkit-config.sh

if [ $# -lt 3 ]; then echo "Usage: $0 csvFile outputFile testName"; exit; fi

csvFile="$1"
outputFile="$2"
testName="$3"

R --no-save << EOF
rm(list=ls(all=TRUE))
library(RMINC)

gf1 <- read.csv("$1") # File Model, Must be without double quotations and separated by commas

vs1 <- mincLm( filename ~ $testName + motion + site + gender + age, gf1) # ,data= subset(gf1,diag_3bl==2) # Add Covariates here using group + etc.
vs1[is.na(vs1)] <- 0
# summary(vs1) head(vs1)
mincWriteVolume(vs1,"/home/wang/Documents/bin/fMRIStat/$outputFile", "tvalue-${testName}")
q()
EOF
