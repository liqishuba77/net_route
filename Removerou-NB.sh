#!/bin/bash
#Program designed for NB-2cache
#Created by liqi at 20151214

#########################################################################################
Gwcu=101.71.95.1
Gwcm=112.16.140.129
Gwtt=112.16.140.129
Filename=route-eth0.tst
#删除联通路由
cat /home/route/DataRoute/route-cu.bak | while read Line
do
ip=`echo $Line | awk '{print $1}'`
netmask=`echo $Line | awk '{print $2}'`
echo $ip
if [ $netmask = "255.255.255.255" ]
        then
                echo -ne "\e[31;40;1m[Defult route can't delete]\e[0m\n"
        else
                route del -net $ip netmask $netmask gw $Gwcu
                if [ $? -eq 0 ]
                        then
                                echo -ne "\e[32;40;1m[OK]\e[0m\n"
                        else
                                echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
                                echo $ip >> /tmp/netroudelfail-cu.txt
                        fi
        fi
done
echo -ne "\e[31;40;1m[route-ct DEL Done]\e[0m\n"
#########################################################################################
#删除移动路由
if [[ ${Gwcu} != ${Gwcm} ]]
	then
		cat /home/route/DataRoute/route-cm.bak | while read Line
		do
		ip=`echo $Line | awk '{print $1}'`
		netmask=`echo $Line | awk '{print $2}'`
		echo $ip
		if [ $netmask = "255.255.255.255" ]
				then
						echo -ne "\e[31;40;1m[Defult route can't delete]\e[0m\n"
				else
						route del -net $ip netmask $netmask gw $Gwcm
						if [ $? -eq 0 ]
								then
										echo -ne "\e[32;40;1m[OK]\e[0m\n"
								else
										echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
										echo $ip >> /tmp/netroudelfail-cm.txt
								fi
				fi
		done
		echo -ne "\e[31;40;1m[route-cm DEL Done]\e[0m\n"
fi
#########################################################################################
#删除铁通路由
if [[ ${Gwcu} != ${Gwtt} && ${Gwcm} != ${Gwtt} ]]
	then
		cat /home/route/DataRoute/route-tt.bak | while read Line
		do
		ip=`echo $Line | awk '{print $1}'`
		netmask=`echo $Line | awk '{print $2}'`
		echo $ip
		if [ $netmask = "255.255.255.255" ]
				then
						echo -ne "\e[31;40;1m[Defult route can't delete]\e[0m\n"
				else
						route del -net $ip netmask $netmask gw $Gwtt
						if [ $? -eq 0 ]
								then
										echo -ne "\e[32;40;1m[OK]\e[0m\n"
								else
										echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
										echo $ip >> /tmp/netroudelfail-tt.txt
								fi
				fi
		done
		echo -ne "\e[31;40;1m[route-tt DEL Done]\e[0m\n"
fi

rm -f /home/route/DataRoute/*
rm -f /tmp/route.bak
rm -f /etc/sysconfig/network-scripts/route-eth0
rm -f /etc/sysconfig/network-scripts/route-bond0