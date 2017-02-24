#!/bin/bash
source /home/route/NewRoute/Route_function.shell

Download_Netfile && Updata_Program && Diff_Netfile
Modify_Crontab
Rsync_Old_Program
Judge_Bond
Choose_JF
echo $Gwct $Gwcu $Gwcm $Gwtt $JiFang
Modify_ROUTE
