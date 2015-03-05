dataset = 'adni'; groups = {'cn', 'emci', 'lmci', 'ad'};
mask = '/data/data03/wang/output/20150216_afterQC/adni_mask/all.mnc';
outputFile = '/home/wang/Documents/bin/fMRIStat/b10_MincStats.txt';
command = ['mincstats -quiet -mean -mask ' mask ' -mask_binvalue 1']; % t-average within mask
% command = ['mincstats -mask ' mask ' -mask_binvalue 1 -quiet -floor 2 -volume']; % Volume of voxels > 5
data = readingXlsx(dataset);

output = '';
for seed = {'lA', 'lP'} % seed = {'PCC'}
	for patientGroup = groups
	group_t = replaceCellSubstring(data.(patientGroup{1}).files,'seed', seed{1});
        group_t = replaceCellSubstring(group_t,'data2', 'data100fwhm');
        for individual_t = group_t
            [~, value] = system([command ' ' individual_t{1}]);
            value = strtrim(value);
            output = [output individual_t{1} ' ' value char(10)];
        end
	end
end
theFile = fopen(outputFile,'w+');
fprintf(theFile,output);
fclose(theFile);
