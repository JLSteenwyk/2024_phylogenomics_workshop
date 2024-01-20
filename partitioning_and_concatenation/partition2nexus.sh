echo -e "#nexus\nbegin sets;"
cat $1 | sed 's/=/ /g' | \
	awk '{print "\tcharset part"NR" = " $NF";"}'
echo -e -n "\tcharpartition mine = " ; cat $1 | awk '{print $1}' | \
	sed 's/,//g' | awk '{print $1":part"NR","}' | tr "\n" " " | sed 's/, $/;/g' | sed -e '$a\'
echo -e "end;"
