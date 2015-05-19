% Input information
data = readingXlsx('mcsaFtd');
outputFolder = '/data/data03/wang/output/20150420_ftdResults';

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

%% Anterior-Posterior
% CN
outputBase = [outputFolder '/xrAvP_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% FTD
outputBase = [outputFolder '/xrAvP_4_mcsaFtd'];
group1_files = replaceCellSubstring(data.ftd.files,'seed', 'rA');
group2_files = replaceCellSubstring(data.ftd.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%{
%% Assymetry in controls
% Anterior mcsaFtd
outputBase = [outputFolder '/zlvrA_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior mcsaFtd
outputBase = [outputFolder '/zlvrP_1_mcsaFtd'];
group1_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
%}
