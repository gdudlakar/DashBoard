#!/bin/bash
declare -a client=("aimglobal" "andromeda" "codebase" "dotapp" "dotodoor" "fintranssolutions" "hiranandani" "ingram" "letstalkcomm" "mcloud" "motherhoodhospital" "oscorp" "partner" "pranaliconsultants" "pym" "stark" "suntech" "totuba" "trial1" "triggerworldwide" "unicornready" "websym" "whitehorse" "younion" "zoozle" "wizrdom" "caps" "tbj" "mopharma" "xencia" "imthyderabad" "swamisukhabodhananda")
for i in ${client[@]};do
FILE=/home/mykampaign/public_html/$i/app/spool/default
if test -e "$FILE"; then
   wc=`ls $FILE | wc -l`
if [ $wc -ge 1 ]
then
  for FILE in *; do
   start=`stat -c %Y $FILE`
   end=`date +%s`
   diff=$(($end -$start))
   day=$(($diff/86400))
   echo "$FILE -> The Time diff in curent and last modified -> $day and spool is $w"
 done
fi
fi
done

#!/bin/bash
declare -i start=0
declare -i end=0
declare -i diff=0
declare -i day=0
file=/home/mykampaign/etc/logTest/

for file in $(ls --hide="-*.message"); do
   start=`stat -c %Z $file`
   end=`date +%s`
   diff=$(($end-$start))
   day=$(($diff/86400))
echo "$FILE   -> $Diff( $end -  $start ) and division $day($diff/86400)"
done
