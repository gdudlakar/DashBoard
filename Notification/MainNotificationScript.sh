#!/bin/bash
##email subject
##sending mail as
from="Admin@mykampaign.com"
## sending mail to
to="guru@gmail.com"
## send carbon copy to
also_to="gdudalkar@gmail.com"

#This is the Media folder notification script 
#START
declare -a client=("aimglobal" "andromeda" "codebase" "dotapp" "dotodoor" "fintranssolutions" "hiranandani" "ingram" "letstalkcomm" "mcloud" "motherhoodhospital" "oscorp" "partner" "pranaliconsultants" "pym" "stark" "suntech" "totuba" "trial1" "triggerworldwide" "unicornready" "websym" "whitehorse" "younion" "zoozle" "wizrdom" "caps" "tbj" "mopharma" "xencia" "imthyderabad" "swamisukhabodhananda")
for i in ${client[@]};do
size=`du -sm /home/mykampaign/public_html/$i/media/ | awk '{print $1}'`
if [ $size -ge 10000 ]
then
echo -e "Media folder $i is exceeds one GB!\n\nFolder size is: $size MB" | mailx -s "Media Folder Warrning Size Is 1GB" -r "$from" -c "$to" "$also_to"
fi
done
#END

#RAM Notification Script
#START
## get total free memory size in megabytes(MB) 
free=$(free -mt | grep Total | awk '{print $4}')

## check if free memory is less or equals to  1000MB
if [[ "$free" -le 1000 ]]; then
        echo -e "Warning,Main memory running low!\n\nFree memory: $free MB" | mailx -s "RAM Running Low" -r "$from" -c "$to" "$also_to"
fi
#END

#Spool exceeds one day! notification
#START
declare -i start=0
declare -i end=0
declare -i diff=0
declare -i day=0
declare -a client=("aimglobal" "andromeda" "codebase" "dotapp" "dotodoor" "fintranssolutions" "hiranandani" "ingram" "letstalkcomm" "mcloud" "motherhoodhospital" "oscorp" "partner" "pranaliconsultants" "pym" "stark" "suntech" "totuba" "trial1" "triggerworldwide" "unicornready" "websym" "whitehorse" "younion" "zoozle" "wizrdom" "caps" "tbj" "mopharma" "xencia" "imthyderabad" "swamisukhabodhananda")
path=/home/mykampaign/etc/logTest/SpoolSizeList.txt
for i in ${client[@]};do
FILE=/home/mykampaign/public_html/$i/app/spool/default
if test -e "$FILE"; then
   wc=`ls $FILE | wc -l`
if [ $wc -ge 1 ]
then
  for file in "$FILE"/*; do
  start=`stat -c %Z $file`
  end=`date +%s`
  diff=$(($end-$start))
  day=$(($diff/86400))
  echo "$i -> Exceeds one day  $day" >> $path
if [ $day -ge 1 ]
then
echo -e "Warning,Spool exceeds one day!\n\nSpool is from $i" | mailx -s "Spool 1 Day exceeds Warrning " -r "$from" -c "$to" "$also_to"
break
fi
done
fi
fi
done
#END

#Disk Notification if Disk Exceeds 80%
#START
Disk=`df -h |grep /dev/vda1  | awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "Percent used: $USE" | mailx -s "Running out of disk space" -r "$from" -c "$to" "$also_to"
fi
#END

#Disak Usage in Inside PH And Outside PH
#STRAT
FileSize=/home/mykampaign/etc/logTest/DashBoard/FileSize.txt

outerPH=`du -h /home/mykampaign/ | grep ^[2-9][0-9.]*G | wc -l`
insidePH=`du -h /home/mykampaign/public_html | grep ^[5-9][0-9.]*G | wc -l`
if [ $outerPH -ge 1 -o $insidePH -ge 1 ] 
then
    du -h /home/mykampaign/ | grep ^[2-9][0-9.]*G >> $FileSize
    du -h /home/mykampaign/public_html | grep ^[5-9][0-9.]*G >> $FileSize
    echo -e "Server consuming more memory in either\n\n /home/mykampaign/ niether /home/mykampaign/public_html please check the attachment"| mailx -a "$FileSize" -s "Warrning Disk Usage" -r "$from" -c "$to" "$also_to"
fi
#END

#
#START