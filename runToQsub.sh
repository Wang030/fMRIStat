#!/bin/sh

if [ $# -ne 2 ]; then echo "Usage: $0 <scriptLocation> <matlabCommand>"; exit; fi

qsub -cwd -q long.q <<END
#!/bin/sh

source /opt/minc/init.sh
source /opt/minc-toolkit/minc-toolkit-config.sh
IFS=$'\n'
/opt/matlab12b/bin/matlab -nodisplay -nosplash -r "addpath('$1'); $2"

END
