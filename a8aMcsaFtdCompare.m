% Input information
data = readingXlsx('mcsaFtd');
outputFolder = '/data/data03/wang/output/20150420_ftdResults';

% Choose groups of interest

%% PCC
seed = 'PCC';
% 1v6 mcsa
outputBase = [outputFolder '/gc_' seed '_1v6_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ftd.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ftd.covariates;
save([outputBase '.mat']);

%% lP
seed = 'lP';
% 1v6 mcsa
outputBase = [outputFolder '/gc_' seed '_1v6_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ftd.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ftd.covariates;
save([outputBase '.mat']);

%% lA
seed = 'lA';
% 1v6 mcsa
outputBase = [outputFolder '/gc_' seed '_1v6_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ftd.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ftd.covariates;
save([outputBase '.mat']);

%% Anterior-Posterior
% CN
outputBase = [outputFolder '/xlAvP_1_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% FTD
outputBase = [outputFolder '/xlAvP_4_mcsa'];
group1_files = replaceCellSubstring(data.ftd.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.ftd.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%% Assymetry in controls
% Anterior mcsa
outputBase = [outputFolder '/zlvrA_1_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior mcsa
outputBase = [outputFolder '/zlvrP_1_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
