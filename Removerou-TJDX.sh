#!/bin/bash
#Program designed for TJDX-2cache
#Created by liqi at 20161108

#########################################################################################
Gwct=119.90.26.1
Gwcm=117.131.201.129
Gwtt=117.131.201.129
Filename=route-eth0.tst
##########################################################################################
##删除电信路由

cat /home/route/DataRoute/route-ct.bak | while read Line
do
ip=`echo $Line | awk '{print $1}'`
netmask=`echo $Line | awk '{print $2}'`
echo $ip
if [ $netmask = "255.255.255.255" ]
	then
		echo -ne "\e[31;40;1m[Defult route can't delete]\e[0m\n"
	else
		route del -net $ip netmask $netmask gw $Gwct
		if [ $? -eq 0 ]
        		then
                		echo -ne "\e[32;40;1m[OK]\e[0m\n"
        		else
                		echo -ne "\e[31;40;1m[FAILED]\e[0m\n"
				echo $ip >> /tmp/netroudelfail-ct.txt
        		fi
	fi
done
echo -ne "\e[31;40;1m[route-ct DEL Done]\e[0m\n"
#########################################################################################
#删除移动路由
if [[ ${Gwct} != ${Gwcm} ]]
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
if [[ ${Gwct} != ${Gwtt} && ${Gwcm} != ${Gwtt} ]]
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
