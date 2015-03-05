#!/bin/sh
source /home/vfonov/quarantine/init.sh

if [ $# -ne 3 ]; then echo "Usage: $0 csvFile outputFile testName"; exit; fi

csvFile="$1"
outputFile="$2"
testName="$3"

R --no-save << EOF
rm(list=ls(all=TRUE))
library(RMINC)

gf1 <- read.csv("$1") # File Model, Must be without double quotations and separated by commas

vs1 <- mincLm( filename ~ "$testName" + datasetN, gf1) # Add Covariates here using group + etc.
vs1[is.na(vs1)] <- 1
mincWriteVolume(vs1,$outputFile, $testName)
q()
EOF