% Input information
data = readingXlsx('adni');
outputFolder = '/data/data03/wang/output/20150216_afterQC';

% Choose groups of interest

%% PCC
seed = 'PCC';
% 1v4 adni
outputBase = [outputFolder '/gc_' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = [outputFolder '/gc_' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = [outputFolder '/gc_' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% lP
seed = 'lP';
% 1v4 adni
outputBase = [outputFolder '/gc_' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = [outputFolder '/gc_' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = [outputFolder '/gc_' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% lA
seed = 'lA';
% 1v4 adni
outputBase = [outputFolder '/gc_' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = [outputFolder '/gc_' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = [outputFolder '/gc_' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% Anterior-Posterior
% CN
outputBase = [outputFolder '/xlAvP_1_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% eMCI
outputBase = [outputFolder '/xlAvP_2_adni'];
group1_files = replaceCellSubstring(data.emci.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.emci.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% lMCI
outputBase = [outputFolder '/xlAvP_3_adni'];
group1_files = replaceCellSubstring(data.lmci.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.lmci.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% AD
outputBase = [outputFolder '/xlAvP_4_adni'];
group1_files = replaceCellSubstring(data.ad.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.ad.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%% Assymetry in controls
% Anterior adni
outputBase = [outputFolder '/zlvrA_1_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = [outputFolder '/zlvrP_1_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
