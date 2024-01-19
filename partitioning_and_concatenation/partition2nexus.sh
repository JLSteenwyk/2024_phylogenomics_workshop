echo -e "#nexus\nbegin sets;" |tee ${1}.nex

cat $1 | \
while read i ; do
  start_stop=$(echo "$i" | awk '{print $NF}' | sed 's/^.*=//g') ; 
  part=$(echo "$i" | sed 's/^.*\///g' | sed 's/=.*$//g') ; 
  model=$(echo "$i" | sed 's/,//g' | awk '{print $1}') ; 
  echo -e "\tcharset $part = ${start_stop};" ; 
done |tee -a ${1}.nex

echo -e -n "\tcharpartition mine = " |tee -a ${1}.nex

cat $1 | \
while read i ; do
  start_stop=$(echo "$i" | awk '{print $NF}' | sed 's/^.*=//g') ; 
  part=$(echo "$i" | sed 's/^.*\///g' | sed 's/=.*$//g') ; 
  model=$(echo "$i" | sed 's/,//g' | awk '{print $1}') ; 
  echo -n "${model}:${part}, " ; 
done | sed 's/, $/;/g' |tee -a ${1}.nex

echo "" |tee -a ${1}.nex

echo -e "end;" |tee -a ${1}.nex
