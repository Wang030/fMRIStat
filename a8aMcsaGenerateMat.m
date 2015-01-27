% Input information
data = readingXlsx();

% Choose groups of interest

%% rP
seed = '/rP';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v4_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v3_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);

%% lP
seed = '/lP';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v4_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v3_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);

%% rA
seed = '/rA';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v4_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v3_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);

%% lA
seed = '/lA';
% 1v4 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v4_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);
% 1v3 mcsa
outputBase = ['/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/' seed '_1v3_mcsa'];
group1_ef = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_ef = replaceCellSubstring(data.mci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.mci.covariates;
fwhm_varatio = -100;
save([outputBase '.mat']);

%% Assymetry in controls
% Anterior mcsa
outputBase = '/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/lvrA_1_mcsa';
group1_ef = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_ef = replaceCellSubstring(data.cn.files,'/seed', '/rA');
save([outputBase '.mat']);
% Posterior mcsa
outputBase = '/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/lvrP_1_mcsa';
group1_ef = replaceCellSubstring(data.cn.files,'/seed', '/lP');
group2_ef = replaceCellSubstring(data.cn.files,'/seed', '/rP');
save([outputBase '.mat']);

%% Anterior-Posterior
% Left mcsa
outputBase = '/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/lAvP_1_mcsa';
group1_ef = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_ef = replaceCellSubstring(data.cn.files,'/seed', '/lP');
save([outputBase '.mat']);
% Right mcsa
outputBase = '/data/data03/wang/output/20141201_groupComparisonHippocampusMcsa/rAvP_1_mcsa';
group1_ef = replaceCellSubstring(data.cn.files,'/seed', '/rA');
group2_ef = replaceCellSubstring(data.cn.files,'/seed', '/rP');
save([outputBase '.mat']);
