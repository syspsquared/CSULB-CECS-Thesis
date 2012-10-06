#############################
#!/bin/sh
# This script takes in a file of student homes, then cds to each.
# mv .xinitrc .xinitrc.bak
v_homefile="$1"
v_filetomv="./.xinitrc"
v_logfile="/tmp/mvlog.log"

while read homedir
do
  echo "Moving to $homedir" >> "$v_logfile" 2>&1
  cd "$homedir"  >> "$v_logfile" 2>&1
  if [ -e "$v_filetomv" ];then
    echo "mving file $v_filetomv to ${v_filetomv}.bak..." >> "$v_logfile" 2>&1
    mv "${v_filetomv}" "${v_filetomv}".bak >> "$v_logfile" 2>&1
  else
    echo "$v_filetomv in $homedir not found." >> "$v_logfile" 2>&1
  fi
done < "$v_homefile"
