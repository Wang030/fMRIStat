function combiningSubjects(outputBase, group_ef, fwhm_varatio)

addpath(genpath('/opt/matlab7.5/toolbox/fmristat')); addpath(genpath('/opt/matlab12b/toolbox/emma'),'-end');

% Create the equivalent SD
group_sd = replaceCellSubstring(group_ef,'_ef.mnc','_sd.mnc');

X = ones(length(group_ef),1);
input_ef = group_ef';
input_sd = group_sd';

contrast = 1;
which_stats='_ef _sd _t';
output_file_base{1} = outputBase;

%% Getting the local computer's name
[~,gb_psom_localhost] = system('uname -n');
gb_psom_localhost = deblank(gb_psom_localhost);
display(gb_psom_localhost);

my_multistat(input_ef,input_sd,[],[],X,contrast,output_file_base,which_stats,fwhm_varatio);
