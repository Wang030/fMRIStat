dataset = 'mcsa'; groups = {'cn', 'emci', 'lmci', 'ad'};
output = '/data/data03/wang/output/20150216_afterQCfwhm6/';
data = readingXlsx(dataset);

for seed = {'lA', 'lP', 'PCC', 'rA', 'rP'}
	for patientGroup = groups
		outputBase = [output '/avg_' seed{1} '_' patientGroup{1} '_' dataset];
		group_t = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
		fwhm_varatio = -6;

		for i = 1:length(group_t)
			file = group_t{i};
			if ~exist(file,'file'); group_t{i} = []; end
		end
		group_t = group_t(~cellfun('isempty', group_t));
		save([outputBase '.mat']);
	end
end
