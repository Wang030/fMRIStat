#!/bin/sh

if [ $# -lt 2 -o $# -gt 3 ]; then echo "Usage: $0 <scriptLocation> <matlabCommand> (.mat File)"; exit; fi

if [ $# -eq 3 ]; then go="load('$3'); $2"
else go="$2"; fi

qsub -cwd -q long.q <<END
#!/bin/sh

source /opt/minc/init.sh
source /opt/minc-toolkit/minc-toolkit-config.sh
IFS=$'\n'
/opt/matlab12b/bin/matlab -nodisplay -nosplash -r "addpath('$1'); $go"

END
