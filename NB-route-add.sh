#!/bin/bash
#Program designed for NB-2cache
#Created by liqi at 20151214

#########################################################################################
Gwcu=101.71.95.1
Gwcm=112.16.140.129
Gwtt=112.16.140.129
Filename=route-eth0.tst
route -n > /home/route/route-bak.bak
#添加联通路由
for ip in `cat /home/route/NewRoute/route-cu.txt`
do
echo $ip
#echo "$ip via $Gwcu" >> /etc/sysconfig/network-scripts/$Filename
route add -net $ip gw $Gwcu
if [ $? -eq 0 ]
        then
                echo -ne "\e[32;40;1m[OK]\e[0m\n"
		echo "$ip via $Gwcu" >> /etc/sysconfig/network-scripts/$Filename
        else
                echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
		echo $ip >> /tmp/netroufail-cu.txt
        fi
done
echo -ne "route-cu \e[31;40;1m[Done]\e[0m\n"
#########################################################################################
#添加移动路由

for ip in `cat /home/route/NewRoute/route-cm.txt`
do
echo $ip
#echo "$ip via $Gwcm" >> /etc/sysconfig/network-scripts/$Filename
route add -net $ip gw $Gwcm
if [ $? -eq 0 ]
        then
                echo -ne "\e[32;40;1m[OK]\e[0m\n"
		echo "$ip via $Gwcm" >> /etc/sysconfig/network-scripts/$Filename
        else
                echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
		echo $ip >> /tmp/netroufail-cm.txt
        fi
done
echo -ne "route-cm \e[31;40;1m[Done]\e[0m\n"
#########################################################################################
#添加铁通路由
for ip in `cat /home/route/NewRoute/route-tt.txt`
do
echo $ip
#echo "$ip via $Gwtt" >> /etc/sysconfig/network-scripts/$Filename
route add -net $ip gw $Gwtt
if [ $? -eq 0 ]
        then
                echo -ne "\e[32;40;1m[OK]\e[0m\n"
		echo "$ip via $Gwtt" >> /etc/sysconfig/network-scripts/$Filename
        else
                echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
		echo $ip >> /tmp/netroufail-tt.txt
        fi
done
echo -ne "route-tt \e[31;40;1m[Done]\e[0m\n"
route -n | egrep "$Gwcu" | awk '{print $1,$3}' > /home/route/DataRoute/route-cu.bak
route -n | egrep "$Gwcm" | awk '{print $1,$3}' > /home/route/DataRoute/route-cm.bak
route -n | egrep "$Gwtt" | awk '{print $1,$3}' > /home/route/DataRoute/route-tt.bak
echo -ne "\e[31;40;1m[COPY DONE!]\e[0m\n"
