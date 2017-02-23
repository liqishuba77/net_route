#!/bin/bash

for FILE_MD5 in $(ls /home/route/NewRoute/* | grep -v md5); do
 md5sum ${FILE_MD5} | awk '{print $1}' > ${FILE_MD5}.md5
done
