#!/bin/bash
#Program designed for SH-2cache
#Created by liqi at 20151214

#########################################################################################
Gwcu=112.65.200.1
Gwct=114.80.72.1
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
#添加电信路由

for ip in `cat /home/route/NewRoute/route-ct.txt`
do
echo $ip
#echo "$ip via $Gwct" >> /etc/sysconfig/network-scripts/$Filename
route add -net $ip gw $Gwct
if [ $? -eq 0 ]
        then
                echo -ne "\e[32;40;1m[OK]\e[0m\n"
		echo "$ip via $Gwct" >> /etc/sysconfig/network-scripts/$Filename
        else
                echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
		echo $ip >> /tmp/netroufail-ct.txt
        fi
done
echo -ne "route-ct \e[31;40;1m[Done]\e[0m\n"
route -n | egrep "$Gwcu" | awk '{print $1,$3}' > /home/route/DataRoute/route-cu.bak
route -n | egrep "$Gwct" | awk '{print $1,$3}' > /home/route/DataRoute/route-ct.bak
echo -ne "\e[31;40;1m[COPY DONE!]\e[0m\n"
