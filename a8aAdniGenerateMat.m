data = readingXlsx();

%% rP
seed = '/rP';
% 1v4 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% lP
seed = '/lP';
% 1v4 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% rA
seed = '/rA';
% 1v4 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% lA
seed = '/lA';
% 1v4 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% PCC
seed = '/PCC';
% 1v4 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v4_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.ad.covariates;
save([outputBase '.mat']);
% 1v3 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v3_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.lmci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.lmci.covariates;
save([outputBase '.mat']);
% 1v2 adni
outputBase = ['/data/data03/wang/output2/' seed '_1v2_adni'];
group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
group2_files = replaceCellSubstring(data.emci.files,'/seed', seed);
group1_covariates = data.cn.covariates;
group2_covariates = data.emci.covariates;
save([outputBase '.mat']);

%% Assymetry in controls
% Anterior adni
outputBase = '/data/data03/wang/output2/zlvrA_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/rA');
save([outputBase '.mat']);
% Posterior adni
outputBase = '/data/data03/wang/output2/zlvrP_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lP');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/rP');
save([outputBase '.mat']);

%% Anterior-Posterior
% Left adni
outputBase = '/data/data03/wang/output2/zlAvP_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/lA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/lP');
save([outputBase '.mat']);
% Right adni
outputBase = '/data/data03/wang/output2/zrAvP_1_adni';
group1_files = replaceCellSubstring(data.cn.files,'/seed', '/rA');
group2_files = replaceCellSubstring(data.cn.files,'/seed', '/rP');
save([outputBase '.mat']);
