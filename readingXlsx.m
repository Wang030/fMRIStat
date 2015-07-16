function data = readingXlsx(dataset, covariates, xlsFile)

switch dataset
	case 'mcsa'
		if ~exist('covariates','var'); covariates = {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD'}; end
		groups = {'cn', 'useless', 'mci', 'ad'};
		locationBase = '/data/data03/wang/input/20150119_mcsa/fMRIStat/seed/data2';
		xlsFile = 'Book1.xlsx';
	case 'mcsaFtd'
		if ~exist('covariates','var'); covariates = {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD'}; end
		groups = {'cn', 'useless', 'useless2','useless3', 'useless4','ftd'};
		locationBase = '/data/data03/wang/input/20150327_mcsaFtd/fMRIStat/seed/data2';
		dataset = 'mcsa';
		xlsFile = 'BookFtd.xlsx';
	case 'adni'
		if ~exist('covariates','var'); covariates = {'PTGENDER', 'PTEDUCAT', 'scanAge', 'FD', 'SITEID', 'T_hipp'}; end
		groups = {'cn', 'emci', 'lmci', 'ad'};
		locationBase = '/data/data03/wang/input/20150119_ADNI/fMRIStat/seed/data2';
		xlsFile = 'Book1.xlsx';
	otherwise
		error('Dataset not recognized. Please try again.');
end

[~,~,xlsx] = xlsread(xlsFile); % Read .xlsx file
for i = 1:size(xlsx,2)
    switch xlsx{1,i}
        case 'diag2'; colDiag = i;
        case 'dataset'; colDataset = i;
        case 'filename'; colFile = i;
        case 'qc2'; colQc = i;
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
    flag = 0;
    if ~strcmp(xlsx{i,colDataset},dataset); continue; end % If not the desired dataset, skip/ignore
    if ~isnan(xlsx{i,colQc}); continue; end % Skip if there is a mention in the qc column
    j = xlsx{i,colDiag}; % Diagnosis
    
    try % If data don't exist
        data.(groups{j}).files{end+1,1} = [locationBase '/' xlsx{i,colFile}];
    catch ME
		flag = 1;
    end
    if isnan(j); continue; end
    
    rowPosition = length(data.(groups{j}).files);
    if ~exist('colCovariates','var'); data.(groups{j}).covariates = [];
    else for k = 1:length(colCovariates)
        if isnan(xlsx{i,colCovariates{k}}); flag = 1; break; end % If data is missing, flag it
        try
            data.(groups{j}).covariates(rowPosition,k) = xlsx{i,colCovariates{k}};
        catch ME
            data.(groups{j}).covariates(rowPosition,k) = 5; % To ensure there is at least a new row created
            flag = 1;
    	    break;
        end
    end; end
    
    if (flag == 1); % If data is missing, delete generated row
        data.(groups{j}).files(end,:) = [];
        data.(groups{j}).covariates(end,:) = [];
    end
end
