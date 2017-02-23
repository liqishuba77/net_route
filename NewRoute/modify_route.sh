#!/bin/bash
source /home/route/NewRoute/Route_function.shell

Download_Netfile && Updata_Program && Diff_Netfile
Judge_Bond
Choose_JF
echo $Gwct $Gwcu $Gwcm $Gwtt
Modify_ROUTE
