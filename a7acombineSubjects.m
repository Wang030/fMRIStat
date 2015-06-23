dataset = 'mcsaFtd'; groups = {'cn', 'ftd'};
output = '/data/data03/wang/output/20150525_ftdResultsWithScrubbingAverageMapsBoosted/';
data = readingXlsx(dataset);

for seed = {'rA', 'rP', 'lA', 'lP', 'PCC'}
	for patientGroup = groups
		outputBase = [output '/avg_' seed{1} '_' patientGroup{1} '_' dataset];
		group_t = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
		fwhm_varatio = -100; %-30

		for i = 1:length(group_t)
			file = group_t{i};
			if ~exist(file,'file'); group_t{i} = []; end
		end
		group_t = group_t(~cellfun('isempty', group_t));
		save([outputBase '.mat']);
	end
end
