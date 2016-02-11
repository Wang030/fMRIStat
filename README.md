# fMRIStat

Contains a compilation of bash and matlab scripts, from the NIAK output to generate group-level comparison and group-level averages.
* a1 smoothes the rs-fMRI images
* a2 starts the seed-based analysis using the fmrilm-fMRIStat module
* a4 combine multiple rs-fmri runs. This is because most scanning sessions from ADNI contains several runs per scanning session. We opted to combine them.
* a7a creates group-level average maps
* a8a creates group-level comparison maps
* a9 parses statistical images with a multiple comparison filter (FDR or RFT)
