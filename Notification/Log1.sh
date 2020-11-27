#!/bin/bash
##email subject 
subject="Server Memory Status Alert"
##sending mail as
from="Admin@augplat.com"
## sending mail to
to="guru@augplat.com"
## send carbon copy to
also_to="gdudalkar@gmail.com"

size=10

Log=`du -ms /var/log/ |  awk '{ print $1 }' | cut -d'M' -f1`
Log1=`du -ms /usr/local/apache/logs/ | awk '{ print $1 }' | cut -d'M' -f1`
Log2=`du -ms /var/log/cron |  awk '{ print $1 }' | cut -d'M' -f1`

# If Log Files Exits More than 10 MB it will notify me
if [ $Log -gt $size ]; then
    
    echo -e "Warning, LOG:-> /var/log/ <- memory is More than 10MB!\n\nFile size is: $Log MB" | mailx -s "$subject" -r "$from" -c "$to" "$also_to"
fi

if [ $Log1 -gt $size ]; then
    
    echo -e "Warning, LOG:-> /usr/local/apache/logs/ <- memory is More than 10MB!\n\nFile size is: $Log1 MB" | mailx -s "$subject" -r "$from" -c "$to" "$also_to"
fi

if [ $Log2 -gt $size ]; then
    
    echo -e "Warning, LOG:-> /usr/local/apache/logs/ <- memory is More than 10MB!\n\nFile size is: $Log2 MB" | mailx -s "$subject" -r "$from" -c "$to" "$also_to"
fi