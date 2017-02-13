#!/bin/sh
#This program is created to add route
#For add a NIC
#Cteated BY LIQI at 2016/01/18
#Updated BY LIQI at 2016/11/08
Flag=`ifconfig eth0 | grep "inet addr:"`

if [[ -e /tmp/route.bak ]]
	then
		echo -ne "\e[31;40;1m[The Route script has been run !]\e[0m\n"
		exit 1
	else
	echo -e "\e[32;40;1m[开始判断机房... !]\e[0m\n"
	sleep 1
fi

if [[ -n `ip a | grep 10.208` ]]
	then
		echo -e "\e[32;40;1m[这是上海多线的机器 !]\e[0m\n"
		sleep 1
		echo -e "\e[32;40;1m[开始判断网卡是否聚合... !]\e[0m\n"
		sleep 1
		if [[ -n $Flag ]]
			then
				echo -e "\e[32;40;1m[网卡未聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-eth0/g' /home/route/SH-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/SH-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
			else
				echo -e "\e[32;40;1m[网卡已聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-bond0/g' /home/route/SH-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/SH-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
		fi
fi

if [[ -n `ip a | grep 101.71.83` ]]
	then
		echo -e "\e[32;40;1m[这是宁波双线联通83网段的机器 !]\e[0m\n"
		sleep 1	
		sed -i 's/Gwcu=101.71.95.1/Gwcu=101.71.83.1/g' /home/route/NB-route-add.sh
		sed -i 's/Gwcu=101.71.95.1/Gwcu=101.71.83.1/g' /home/route/NB-route-add.sh
		echo -e "\e[32;40;1m[增加与删除脚本网关都已替换为83网段 !]\e[0m\n"
		sleep 1
		echo -e "\e[32;40;1m[开始判断网卡是否聚合... !]\e[0m\n"
		sleep 1
		if [[ -n $Flag ]]
			then
				echo -e "\e[32;40;1m[网卡未聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-eth0/g' /home/route/NB-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/NB-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
			else
				echo -e "\e[32;40;1m[网卡已聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-bond0/g' /home/route/NB-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/NB-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
		fi
fi


if [[ -n `ip a | grep 101.71.95` ]]
	then
		echo -e "\e[32;40;1m[这是宁波双线联通95网段的机器 !]\e[0m\n"
		sleep 1
		if [[ -n $Flag ]]
			then
				echo -e "\e[32;40;1m[网卡未聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-eth0/g' /home/route/NB-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/NB-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
			else
				echo -e "\e[32;40;1m[网卡已聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-bond0/g' /home/route/NB-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/NB-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
		fi
fi	

if [[ -n `ip a | grep 125.39.181` ]]
	then
		echo -e "\e[32;40;1m[这是天津多线的机器 !]\e[0m\n"
		sleep 1
		if [[ -n $Flag ]]
			then
				echo -e "\e[32;40;1m[网卡未聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-eth0/g' /home/route/TJDX-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/TJDX-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
			else
				echo -e "\e[32;40;1m[网卡已聚合，准备执行添加路由脚本... !]\e[0m\n"
				sleep 1
				sed -i 's/Filename=route-eth0.tst/Filename=route-bond0/g' /home/route/TJDX-route-add.sh
				route -n >> /tmp/route.bak
				sh /home/route/TJDX-route-add.sh
				echo -e "\e[32;40;1m[路由添加完毕 !]\e[0m\n"
		fi
fi


