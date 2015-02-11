% Input information
seed = 'lA';
covariates = {
    {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD', 'SITEID'}
    {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD'}
    {'PTEDUCAT', 'scanAge', 'FD'}
    {'PTGENDER', 'scanAge', 'FD'}
    {'scanAge', 'FD'}
    {''}
    };

% 1v4 adni
for i = 1:length(covariates)
    clear data;
    data = readingXlsx('adni',covariates{i});
    outputBase = ['/data/data03/wang/output/20150207_adniPlus/gc_' seed '_1v2_adni_' strjoin(covariates{i},'_')];
    group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
    group2_files = replaceCellSubstring(data.emci.files,'seed', seed);
    group1_covariates = data.cn.covariates;
    group2_covariates = data.emci.covariates;
    save([outputBase '.mat']);
end
