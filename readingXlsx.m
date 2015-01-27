function data = readingXlsx()

covariates = {'SITEID', 'MMSCORE', 'apoe', 'amyloid2', 'PTGENDER', 'PTEDUCAT', 'scanAge'};
groups = {'cn', 'emci', 'lmci', 'ad'};
dataset = 'adni';
locationBase = '/data/data03/wang/input/20150119_ADNI/fMRIStat/seed/data2';

[~,~,xlsx] = xlsread('Book1.xlsx');
for i = 1:size(xlsx,2)
    switch xlsx{1,i}
        case 'diag2'; colDiag = i;
        case 'dataset'; colDataset = i;
        case 'filename'; colFile = i;
    end
    for j = 1:length(covariates)
        if strcmp(covariates{1,j},xlsx{1,i})
            colCovariates{j} = i;
        end
    end
end

% Initiate structure
data = struct;
for i = groups
    data.(i{1}).files = cell(0);
    data.(i{1}).covariates = zeros(0,length(covariates));
end

for i = 1:size(xlsx,1)
    if ~strcmp(xlsx{i,colDataset},dataset); continue; end
    j = xlsx{i,colDiag};
    data.(groups{j}).files{end+1,1} = [locationBase '/' xlsx{i,colFile}];
    covariatesRow = size(data.(groups{j}).covariates,1) + 1;
    for k = 1:length(colCovariates)
        try
            data.(groups{j}).covariates(covariatesRow,k) = xlsx{i,colCovariates{k}};
        catch ME
           continue;
        end
    end
end