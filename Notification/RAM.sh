#!/bin/bash 
##email subject 
subject="Server Memory Status Alert"
##sending mail as
from="guru@augplat.com"
## sending mail to
to="guru@augplat.com"
## send carbon copy to
also_to="gdudalkar@gmail.com"

## get total free memory size in megabytes(MB) 
free=$(free -mt | grep Total | awk '{print $4}')

## check if free memory is less or equals to  100MB
if [[ "$free" -le 2000  ]]; then
        echo -e "Warning, server memory is running low!\n\nFree memory: $free MB" | mailx -a "$file" -s "$subject" -r "$from" -c "$to" "$also_to"
fi

exit 0