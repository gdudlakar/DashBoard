#!/bin/bash

Disk=`du -ms /var/tmp/ |  awk '{ print $1 }' | cut -d'M' -f1 | cut -d "." -f1 | cut -d "," -f1`
Disk2=`du -ms /tmp|  awk '{ print $1 }' | cut -d'M' -f1 | cut -d "." -f1 | cut -d "," -f1`
Disk3=`du -ms /home/mykampaign/.trash|  awk '{ print $1 }' | cut -d'M' -f`
Disk4=`du -ms /home/mykampaign/tmp |  awk '{ print $1 }' | cut -d'M' -f1 | cut -d "." -f1 | cut -d "," -f1`
Disk5=`du -ms /home/augplat/tmp |  awk '{ print $1 }' | cut -d'M' -f1 | cut -d "." -f1 | cut -d "," -f1`
sum=$((Disk+Disk2+Disk3+Disk4+Disk5+Disk6+Disk7+Disk8))
echo "$sum MB"