output = '/data/data03/wang/output2/';
dataset = 'adni'; groups = {'cn', 'emci', 'lmci', 'ad'};
data = readingXlsx(dataset);

for seed = {'lA' 'lM' 'lP' 'rA' 'rM' 'rP'}
	for patientGroup = groups
		outputBase = [output '/' seed{1} '_' patientGroup{1} '_' dataset];
		group_t = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
		fwhm_varatio = -100;

		for i = 1:length(group_t)
			file = group_t{i};
			if ~exist(file,'file'); group_t{i} = []; end
		end
		group_t = group_t(~cellfun('isempty', group_t));
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
		group_t = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
		fwhm_varatio = -100;

		for i = 1:length(group_t)
			file = group_t{i};
			if ~exist(file,'file'); group_t{i} = []; end
		end
		group_t = group_t(~cellfun('isempty', group_t));
		save([outputBase '.mat']);
	end
end
