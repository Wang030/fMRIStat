% Input information
data = readingXlsx('mcsaFtd');
outputFolder = '/data/data03/wang/output/20150520_ftdResultsWithScrubbing';

% Choose groups of interest

%% PCC
seed = 'PCC';
% 1v6 mcsaFtd
outputBase = [outputFolder '/gc_' seed '_1v6_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ftd.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ftd.covariates;
save([outputBase '.mat']);

%% rP
seed = 'rP';
% 1v6 mcsaFtd
outputBase = [outputFolder '/gc_' seed '_1v6_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ftd.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ftd.covariates;
save([outputBase '.mat']);

%% rA
seed = 'rA';
% 1v6 mcsaFtd
outputBase = [outputFolder '/gc_' seed '_1v6_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ftd.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ftd.covariates;
save([outputBase '.mat']);

%% Left Anterior-Posterior
% CN
outputBase = [outputFolder '/xlAvP_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% FTD
outputBase = [outputFolder '/xlAvP_6_mcsaFtd'];
group1_files = replaceCellSubstring(data.ftd.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.ftd.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%% Right Anterior-Posterior
% CN
outputBase = [outputFolder '/xrAvP_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% FTD
outputBase = [outputFolder '/xrAvP_6_mcsaFtd'];
group1_files = replaceCellSubstring(data.ftd.files,'seed', 'rA');
group2_files = replaceCellSubstring(data.ftd.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
