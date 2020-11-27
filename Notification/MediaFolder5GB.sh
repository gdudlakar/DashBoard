#!/bin/bash
##email subject 
subject="Server Memory Status Alert"
##sending mail as
from="Admin@mykampaign.com"
## sending mail to
to="girish@augentia.com"
## send carbon copy to
also_to="gdudalkar@gmail.com"


declare -a client=("aimglobal" "andromeda" "codebase" "dotapp" "dotodoor" "fintranssolutions" "hiranandani" "ingram" "letstalkcomm" "mcloud" "motherhoodhospital" "oscorp" "partner" "pranaliconsultants" "pym" "stark" "suntech" "totuba" "trial1" "triggerworldwide" "unicornready" "websym" "whitehorse" "younion" "zoozle" "wizrdom" "caps" "tbj" "mopharma" "xencia" "imthyderabad" "swamisukhabodhananda")
for i in ${client[@]};do
size=`du -sm /home/mykampaign/public_html/$i/media/ | awk '{print $1}'`
if [ $size -ge 1 ]
then
echo -e "Warning, LOG:-> /usr/local/apache/logs/ <- memory is More than 10MB!\n\nFile size is: $Log2 MB" | mailx -s "$subject" -r "$from" -c "$to" "$also_to"
fi
done
