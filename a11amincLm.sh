source /home/vfonov/quarantine/init.sh

for i in `ls /data/data01/wang/output/AAIC_2013/correlation/*.csv`; do
outputFile=`basename $i .csv`
testName=`echo $outputFile | sed "s:_.*::"`
outputFolder=`dirname $i`

R --no-save << EOF
rm(list=ls(all=TRUE))
library(RMINC)

gf1 <- read.csv("$i") # File Model, Must be without double quotations and separated by commas

vs1 <- mincLm( filename ~ $testName + datasetN, gf1) # Add Covariates here using group + etc.
vs1[is.na(vs1)] <- 1
mincWriteVolume(vs1,"$outputFolder/${outputFile}.mnc", "${testName}")
q()
EOF

mincmath -clob -mult $outputFolder/${outputFile}.mnc /data/data01/wang/references/mni_icbm152_t1_tal_nlin_sym_09a_mask_mcsaDimensions.mnc.gz $outputFolder/${outputFile}_mask.mnc
rm $outputFolder/${outputFile}.mnc

done
