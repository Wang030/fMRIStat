output = '/data/data03/wang/output2/';
dataset = 'adni'; groups = {'cn', 'emci', 'lmci', 'ad'};
data = readingXlsx(dataset);

for seed = {'lA' 'lM' 'lP' 'rA' 'rM' 'rP'}
	for patientGroup = groups
		outputBase = [output '/' seed{1} '_' patientGroup{1} '_' dataset];
		group_ef = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
		fwhm_varatio = -100;

		for i = 1:length(group_ef)
			file = group_ef{i};
			if ~exist(file,'file'); group_ef{i} = []; end
		end
		group_ef = group_ef(~cellfun('isempty', group_ef));
		save([outputBase '.mat']);
	end
end

clear;
output = '/data/data03/wang/output2/';
dataset = 'mcsa'; groups = {'cn', 'mci', 'ad'};
data = readingXlsx(dataset);

for seed = {'lA' 'lM' 'lP' 'rA' 'rM' 'rP'}
	for patientGroup = groups
		outputBase = [output '/' seed{1} '_' patientGroup{1} '_' dataset];
		group_ef = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
		fwhm_varatio = -100;

		for i = 1:length(group_ef)
			file = group_ef{i};
			if ~exist(file,'file'); group_ef{i} = []; end
		end
		group_ef = group_ef(~cellfun('isempty', group_ef));
		save([outputBase '.mat']);
	end
end