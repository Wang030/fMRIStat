% Input information
data = readingXlsx('mcsa');

% Choose groups of interest

%% rP
seed = '/rP';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v4_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);Documents
% 1v3 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v3_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
save([outputBase '.mat']);

%% lP
seed = '/lP';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v4_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v3_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
save([outputBase '.mat']);

%% rA
seed = '/rA';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v4_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v3_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
save([outputBase '.mat']);

%% lA
seed = '/lA';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v4_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output2/' seed '_1v3_mcsa'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
save([outputBase '.mat']);

%% Assymetry in controls
% Anterior mcsa
outputBase = '/data/data03/wang/output2/zlvrA_1_mcsa';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior mcsa
outputBase = '/data/data03/wang/output2/zlvrP_1_mcsa';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lP');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%% Anterior-Posterior
% Left mcsa
outputBase = '/data/data03/wang/output2/zlAvP_1_mcsa';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Right mcsa
outputBase = '/data/data03/wang/output2/zrAvP_1_mcsa';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/rA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
