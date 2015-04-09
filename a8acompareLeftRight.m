% Important: requires /home/pedro/bin/mincflip -x data2_orig/$inputFile data2_$inputFile

% Input information
data = readingXlsx('adni');
outputFolder = '/data/data03/wang/output/20150319_assymetryHippocampus/';

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

% Anterior adni
outputBase = [outputFolder '/zlvrA_2_adni'];
group1_files = replaceCellSubstring(data.emci.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.emci.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = [outputFolder '/zlvrP_2_adni'];
group1_files = replaceCellSubstring(data.emci.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.emci.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

% Anterior adni
outputBase = [outputFolder '/zlvrA_3_adni'];
group1_files = replaceCellSubstring(data.lmci.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.lmci.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = [outputFolder '/zlvrP_3_adni'];
group1_files = replaceCellSubstring(data.lmci.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.lmci.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

% Anterior adni
outputBase = [outputFolder '/zlvrA_4_adni'];
group1_files = replaceCellSubstring(data.ad.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.ad.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = [outputFolder '/zlvrP_4_adni'];
group1_files = replaceCellSubstring(data.ad.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.ad.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
