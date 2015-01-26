#!/bin/sh

inputMat="/data/data03/wang/output2/*.mat"
matlabInitiate="addpath('/home/wang/Documents/bin/fMRIStat/'); addpath(genpath('/opt/matlab7.5/toolbox/fmristat')); addpath(genpath('/opt/matlab12b/toolbox/emma'),'-end');"
matlabScript="multiStat(outputBase, group1_ef, group2_ef, group1_covariates, group2_covariates, fwhm_varatio);"

for i in `ls $inputMat`; do
qsub -cwd -q long.q <<END
#!/bin/sh

source /opt/minc-toolkit/minc-toolkit-config.sh
source /opt/minc/init.sh
IFS=$'\n'

/opt/matlab12b/bin/matlab -nodisplay -nosplash -r "${matlabInitiate} load('$i'); $matlabScript"

END
done
