% Input information
seed = '/PCC';
covariates = {'SITEID', 'apoe', 'PTGENDER', 'PTEDUCAT', 'scanAge'};
data = readingXlsx('adni',covariates);


% 1v4 adni
outputBase = ['/data/data03/wang/output/20150204_PCC_adni/' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);