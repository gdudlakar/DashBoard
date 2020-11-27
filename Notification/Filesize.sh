#!/bin/bash
FileSize=/home/mykampaign/etc/logTest/DashBoard/FileSize.txt

outerPH=`du -h /home/mykampaign/ | grep ^[2-9][0-9.]*G | wc -l`
insidePH=`du -h /home/mykampaign/public_html | grep ^[5-9][0-9.]*G | wc -l`
if [ $outerPH -ge 1 -o $insidePH -ge 1] 
then
    du -h /home/mykampaign/ | grep ^[2-9][0-9.]*G >> $FileSize
    du -h /home/mykampaign/public_html | grep ^[5-9][0-9.]*G >> $FileSize
    echo -e "Server consuming more memory in either\n\n /home/mykampaign/ nor /home/mykampaign/public_html"| mailx -a "$FileSize" -s "Warrning Disk Usage" -r "$from" -c "$to" "$also_to"
fi