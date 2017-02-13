#!/bin/bash
#Program designed for SH-2cache
#Created by liqi at 20151214

#########################################################################################
Gwcu=112.65.200.1
Gwct=114.80.72.1
#删除联通路由
cat /home/route/DataRoute/route-cu.bak | while read Line
do
ip=`echo "$Line" | awk '{print $1}'`
netmask=`echo "$Line" | awk '{print $2}'`
echo $Line
if [[ $netmask == "255.255.255.255" ]]
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
echo -ne "\e[31;40;1m[route-cu DEL Done]\e[0m\n"
##########################################################################################
##删除电信路由

if [[ ${Gwcu} != ${Gwct} ]]
	then
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
fi

rm -f /home/route/DataRoute/*
rm -f /tmp/route.bak
rm -f /etc/sysconfig/network-scripts/route-eth0
rm -f /etc/sysconfig/network-scripts/route-bond0
