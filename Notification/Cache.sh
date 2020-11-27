#!/bin/bash

Disk=`du -hs /var/cache |  awk '{ print $1 }' | cut -d'M' -f1`
echo "The size of the /var/cache/ is $Disk"
Disk2=`du -hs /home/mykampaign/.composer/cache |  awk '{ print $1 }' | cut -d'M' -f1`
echo "The size of the /home/mykampaign/.composer/cache is $Disk2"
Disk3=`du -hs /var/cpanel/userdata/augplat/cache | awk '{ print $1 }' | cut -d'M' -f`
echo "The size of the /var/cpanel/userdata/augplat/cache is $Disk3"
sum=$((Disk+Disk2+Disk3))
echo "The Size of the total Cache is - > $sum"