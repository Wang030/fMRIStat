% Input information
data = readingXlsx('adni');

% Choose groups of interest
%{
%% PCC
seed = 'PCC';
% 1v4 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);
%}
%% lP
seed = 'lP';
% 1v4 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% lA
seed = 'lA';
% 1v4 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);
%{
%% Anterior-Posterior
% CN
outputBase = '/data/data03/wang/output/20150207_adniPlus/xlAvP_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% eMCI
outputBase = '/data/data03/wang/output/20150207_adniPlus/xlAvP_2_adni';
group1_files = replaceCellSubstring(data.emci.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.emci.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% lMCI
outputBase = '/data/data03/wang/output/20150207_adniPlus/xlAvP_3_adni';
group1_files = replaceCellSubstring(data.lmci.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.lmci.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% AD
outputBase = '/data/data03/wang/output/20150207_adniPlus/xlAvP_4_adni';
group1_files = replaceCellSubstring(data.ad.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.ad.files,'seed', 'lP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);

%% Assymetry in controls
% Anterior adni
outputBase = '/data/data03/wang/output/20150207_adniPlus/zlvrA_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lA');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rA');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
% Posterior adni
outputBase = '/data/data03/wang/output/20150207_adniPlus/zlvrP_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'seed', 'lP');
group2_files = replaceCellSubstring(data.cn.files,'seed', 'rP');
group1_covariates = [];
group2_covariates = [];
save([outputBase '.mat']);
%}
