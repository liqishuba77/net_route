#!/bin/bash

for TXT in $(ls /home/route/NewRoute/*.txt | grep -v md5); do
 md5sum ${TXT} | awk '{print $1}' > ${TXT}.md5
done
