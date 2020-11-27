#!/bin/bash
for FILE in *; do
   start=`stat -c %Y $FILE`
   end=`date +%s`
   diff=$(($end -$start))
   day=$(($diff/86400))
   echo "$FILE -> The Time diff in curent and last modified -> $day and spool is $w"
 done
