function smoothFmri(inputs, outputFolder, fwhm)

addpath(genpath('/data/data01/wang/references/niak-0.7.1-ammo'));
opt.fwhm = fwhm;
opt.folder_out = outputFolder;
opt.flag_edge = 0;
niak_brick_smooth_vol(inputs, [], opt);
