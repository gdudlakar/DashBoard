#!/bin/bash
MAX=80
size1=1500
EMAIL=guru@augplat.com

Disk=`df -h |grep /dev/vda1  | awk '{ print $5 }' | cut -d'%' -f1`
if [ $USE -gt $MAX ]; then
  echo "Percent used: $USE" | mail -s "Running out of disk space" $EMAIL
fi

