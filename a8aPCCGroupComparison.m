% Input information
seed = '/PCC';
covariates = {
    {'SITEID', 'apoe', 'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD', 'amyloid2'}
    {'SITEID', 'apoe', 'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD'}
    {'SITEID', 'apoe', 'PTEDUCAT', 'FD'}
    {'SITEID', 'apoe', 'PTGENDER', 'FD'}
    {'SITEID', 'apoe', 'scanAge', 'FD'}
    {'SITEID', 'apoe', 'FD'
    };

covariates = {''};
% 1v4 adni
for i = 1:length(covariates)
    clear data;
    data = readingXlsx('adni',covariates{i});
    outputBase = ['/data/data03/wang/output/20150204_PCC_adni/' seed '_1v4_adni_' strjoin(covariates{i},'_')];
    group1_files = replaceCellSubstring(data.cn.files,'/seed', seed);
    group2_files = replaceCellSubstring(data.ad.files,'/seed', seed);
    group1_covariates = {};
    group2_covariates = {};
    save([outputBase '.mat']);
end
