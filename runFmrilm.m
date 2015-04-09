function runFmrilm(input_file, output_base, name, x, y, z, slice_number, time_frames, tr, voxelType)

% Terminate if file exists already
if exist([output_base '_mag_t.mnc'], 'file'); return; end

%Adding paths


system('hostname');
%startIndex = regexpi(input_file,'subject');
%endIndex = regexpi(input_file,'.mnc');
%output_base=[base '/fMRIStat/' name '/data/' a{$i}(startIndex(1):endIndex(1)-1)]
display(name);

%{
mask_thresh = fmri_mask_thresh(input_file);
pca_image(input_file, [], 4, input_file, mask_thresh);
%% set(gcf,'PaperOrientation','landscape');
saveas(gcf, strcat(output_base,'_pca'), 'pdf'); % Save figure
clf;
%}

% Parameters retrieval
if ~exist('time_frames','var')
[~, time_frames] = system(['source /opt/minc/init.sh; mincinfo -attvalue time:length ' input_file]); %Since NIAK scrubbing technique removes certain time frames, time_frames is variable
time_frames = str2double(time_frames); end
if ~exist('slice_number','var')
[~, slice_number] = system(['source /opt/minc/init.sh; mincinfo -attvalue acquisition:num_phase_enc_steps ' input_file]); % mincinfo -attvalue acquisition:num_phase_enc_steps
slice_number = str2double(slice_number); end
if ~exist('tr','var')
[~, tr] = system(['source /opt/minc/init.sh; mincinfo -attvalue time:step ' input_file]); % mincinfo -attvalue acquisition:repetition_time
tr = str2double(tr); end

% Voxel
if (~exist('voxelType', 'var')); voxelType = 'world'; end
if ~strcmp(voxelType,'voxel')
	voxelW = [x y z] % Voxel dimensions
	%display(input_file);
	h=openimage(input_file);
	voxel = voxelW'; % To make worldtovoxel work
	voxel = worldtovoxel(h,voxel,'xyzorder zerobase noflip');
	voxel = round(voxel)
	closeimage(h);
else
	voxel = [x y z]'
end;

% Voxel Enlargment
%x = voxel(1)-1:voxel(1)+1; % radius for seed 3x3x3voxels
%y = voxel(2)-1:voxel(2)+1;
%z = voxel(3)-1:voxel(3)+1;
%[x,y,z] = meshgrid(x,y,z);
%voxel = [x(:),y(:),z(:)]; % Inversed right there

voxel = voxel';

% Acquisition Correction
frametimes=(0:time_frames-1)*tr; % 0:Number of timeframes - 1 * TR
slicetimes=ones(1, slice_number); % number of slices
X_cache=fmridesign(frametimes,slicetimes);

contrast.C=1;
which_stats='_mag_t _mag_ef _mag_sd';
exclude = [1 2 3 4];
%ref_data=squeeze(extract(voxel,input_file));
%confounds = mean(ref_data);
%confounds = confounds(:);

ref_times=frametimes'+slicetimes(voxel(3)+1);
% [df,spatial_av]=fmrilm(input_file);
% grandMeanScaling = mean(spatial_av)*100;
ref_data=squeeze(extract(voxel,input_file));
confounds=fmri_interp(ref_times,ref_data,frametimes,slicetimes);

fmrilm(input_file, output_base, X_cache, contrast, exclude, which_stats, [], [], confounds);
