% Input information
seed = 'lA';
covariates = {
    {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD', 'SITEID', 'T_hipp'}
    {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD', 'SITEID'}
    };

% 1v4 adni
for group = {'emci', 'lmci', 'ad'}
for i = 1:length(covariates)
    clear data;
    data = readingXlsx('adni',covariates{i});
    outputBase = ['/data/data03/wang/output/20150625_withAndWithoutHippocampalAtrophy/gc_' seed '_cnV' group{1} '_adni_' strjoin(covariates{i},'_')];
    group1_files = replaceCellSubstring(data.cn.files,'seed', seed);
    group2_files = replaceCellSubstring(data.(group{1}).files,'seed', seed);
    group1_covariates = data.cn.covariates;
    group2_covariates = data.(group{1}).covariates;
    save([outputBase '.mat']);
end
end
