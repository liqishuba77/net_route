#!/bin/bash
#/usr/bin/md5sum `ls /home/route/NewRoute/* | grep -v md5`> /home/route/NewRoute/md5_route

for TXT in $(ls /home/route/NewRoute/*.txt | grep -v md5); do
 md5sum ${TXT} | awk '{print $1}' > ${TXT}.md5
done
