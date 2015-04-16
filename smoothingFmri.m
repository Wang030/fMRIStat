function smoothingFmri(inputs, fwhm)

addpath(genpath('/data/data01/wang/references/niak-0.7.1-ammo'));
if isempty(fwhm); opt.fwhm = 6; else opt.fwhm = fwhm; end
opt.flag_edge = 1;
niak_brick_smooth_vol(inputs, [], opt);