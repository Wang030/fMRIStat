command-specific options:
General options:
 -verbose:               Print out extra information.
 -quiet:                 Print requested values only.
 -clobber:               Clobber existing files.
 -noclobber:             Do not clobber existing files (default).
 -max_buffer_size_in_kb: maximum size of internal buffers.
		Default value: 4096

Voxel selection options:
 -floor:                 Ignore voxels below this value (list)
 -ceil:                  Ignore voxels above this value (list)
 -range:                 Ignore voxels outside this range (list)
 -binvalue:              Include voxels within 0.5 of this value (list)
 -mask:                  <mask.mnc> Use mask file for calculations.
 -mask_floor:            Exclude mask voxels below this value (list)
 -mask_ceil:             Exclude mask voxels above this value (list)
 -mask_range:            Exclude voxels outside this range (list)
 -mask_binvalue:         Include mask voxels within 0.5 of this value (list)
 -ignore_nan:            Exclude NaN values from stats (default).
 -include_nan:           Treat NaN values as zero.
 -replace_nan:           Replace NaNs with specified value.
		Default value: -1.79769e+308

Histogram Options:
 -histogram:             <hist_file> Compute histogram.
 -hist_bins:             <number> of bins in each histogram.
		Default value: 2000
 -bins:                  synonym for -hist_bins.
		Default value: 2000
 -hist_floor:            Histogram floor value. (incl)
		Default value: -1.79769e+308
 -hist_ceil:             Histogram ceiling value. (incl)
		Default value: 1.79769e+308
 -hist_range:            Histogram floor and ceiling. (incl)
		Default value: -1.79769e+308 1.79769e+308
 -discrete_histogram:    Match histogram bins to data discretization
 -integer_histogram:     Set histogram bins to unit width
 -int_max_bins:          Set maximum number of histogram bins for integer histograms
		Default value: 65536

Statistics (Printed in this order)
 -all:                   all statistics (default).
 -none:                  synonym for -count. (from volume_stats)
 -count:                 # of voxels.
 -percent:               percentage of valid voxels.
 -volume:                volume (in mm3).
 -min:                   minimum value.
 -max:                   maximum value.
 -sum:                   sum.
 -sum2:                  sum of squares.
 -mean:                  mean value.
 -variance:              variance.
 -stddev:                standard deviation.
 -CoM:                   centre of mass of the volume.
 -com:                   centre of mass of the volume.
 -world_only:            print CoM in world coords only.

Histogram Dependant Statistics:
 -hist_count:            # of voxels portrayed in Histogram.
 -hist_percent:          percentage of histogram voxels.
 -median:                median value.
 -majority:              most frequently occurring histogram bin.
 -biModalT:              value separating a volume into 2 classes.
 -pctT:                  <%> threshold at the supplied % of data.
		Default value: 0
 -entropy:               entropy of the volume.
 -otsu:                  Use Otsu '97 algorithm for bimodal threshold (default)
 -kittler:               Use Kittler&Illingworth '86 algorithm for bimodal threshold
 -kapur:                 Use Kapur et al. '85 algorithm for bimodal threshold
 -simple:                Use simple mean-of-means algorithm for bimodal threshold

Generic options for all commands:
 -help:                  Print summary of command-line options and abort
 -version:               Print version number of program and exit

Usage: mincstats [options] <infile.mnc>
       mincstats -help
