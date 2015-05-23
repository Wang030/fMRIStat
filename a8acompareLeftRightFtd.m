% Important: requires cdc/home/pedro/bin/mincflip -x data2_orig/$inputFile data2_$inputFile

% Input information
data = readingXlsx('mcsaFtd');
outputFolder = '/data/data03/wang/output/20150520_ftdResultsWithScrubbing/';

%% Assymetry in controls
% Anterior adni
outputBase = [outputFolder '/zlvrA_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = [outputFolder '/zlvrP_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

% Anterior adni
outputBase = [outputFolder '/zlvrA_6_mcsaFtd'];
group1_files = replaceCellSubstring(data.ftd.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.ftd.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = [outputFolder '/zlvrP_6_mcsaFtd'];
group1_files = replaceCellSubstring(data.ftd.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.ftd.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
