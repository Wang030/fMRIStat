dataset = 'adni'; groups = {'cn', 'emci', 'lmci', 'ad'};
output = '/data/data03/wang/output/20150623_newNetworkArchitecture/';
data = readingXlsx(dataset);

% for fwhm_varatio = [-100 -70 -50 -30 -25 -15 -10 -5 0]
for seed = {'rA', 'rP', 'lA', 'lP', 'PCC'}
	for patientGroup = groups
		fwhm_varatio = -100; %-30
		outputBase = [output '/avg_' seed{1} '_' patientGroup{1} '_' dataset '_' 'var' int2str(fwhm_varatio)];
		group_t = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});

		for i = 1:length(group_t)
			file = group_t{i};
			if ~exist(file,'file'); group_t{i} = []; end
		end
		group_t = group_t(~cellfun('isempty', group_t));
		save([outputBase '.mat']);
	end
end
% end
