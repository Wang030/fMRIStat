%%# Anterior vs Posterior across Disease States

%% ADNI
data = readingXlsx('adni');
% CN
outputBase = '/data/data03/wang/output2/xlAvP_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% eMCI
outputBase = '/data/data03/wang/output2/xlAvP_2_adni';
group1_files = replaceCellSubstring(data.emci.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.emci.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% lMCI
outputBase = '/data/data03/wang/output2/xlAvP_3_adni';
group1_files = replaceCellSubstring(data.lmci.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.lmci.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% AD
outputBase = '/data/data03/wang/output2/xlAvP_4_adni';
group1_files = replaceCellSubstring(data.ad.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.ad.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%% MCSA
clear;
data = readingXlsx('mcsa');
% CN
outputBase = '/data/data03/wang/output2/xlAvP_1_mcsa';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% MCI
outputBase = '/data/data03/wang/output2/xlAvP_3_mcsa';
group1_files = replaceCellSubstring(data.mci.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.mci.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% AD
outputBase = '/data/data03/wang/output2/xlAvP_4_mcsa';
group1_files = replaceCellSubstring(data.ad.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.ad.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);