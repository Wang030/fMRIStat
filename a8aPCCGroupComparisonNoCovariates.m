% Input information
seed = '/PCC';

% 1v4 adni
clear data;
data = readingXlsx('adni');
outputBase = ['/data/data03/wang/output/20150204_PCC_adni/' seed '_1v4_adni_noCovariates'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
