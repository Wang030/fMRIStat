#!/bin/sh

if [ $# -ne 1 ]; then echo "Usage: $0 <text file with list of scripts to run>"; exit; fi

IFS=$'\n'
for i in `cat $1`; do

qsub -cwd -q long.q <<END
#!/bin/sh

source /opt/minc/init.sh
source /opt/minc-toolkit/minc-toolkit-config.sh
$i
END
done
