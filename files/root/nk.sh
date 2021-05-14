#!/bin/sh

#start pppoe-server
if [ -n "$(ps | grep pppoe-server | grep -v grep)" ]
then
	    killall pppoe-server
fi
pppoe-server -k -I br-lan

#clear logs
cat /dev/null > /tmp/pppoe.log

sleep 15 # wait 15s for reboot, or it will throw error for 'you have accessed in'
logger -t nk "try to login at power on"
ifdown netkeeper
ifup netkeeper

while :
do
	# 从 PPPoE server 日志中读取帐号
	if [ "$(grep 'user=' /tmp/pppoe.log | grep 'rcvd' | tail -n 1 | cut -d \" -f 5)" == "]" ]
	then
		username=$(grep 'user=' /tmp/pppoe.log | grep 'rcvd' | tail -n 1 | cut -d \" -f 2)
	fi

	if [ "$username" != "$username_old" ] && [ -z "$(ifconfig | grep "netkeeper")" ]
	then
		ifdown netkeeper
			uci set network.netkeeper.username="$username"
			uci set network.netkeeper.password="$(grep 'user=' /tmp/pppoe.log | grep 'rcvd' | tail -n 1 | cut -d \" -f 4)"
			uci commit
		ifup netkeeper
			username_old="$username"
			logger -t nk "new username $username"
	fi
																        
	sleep 15

	# 拨号失败，断开
	if [ -z "$(ifconfig | grep "netkeeper")" ]
	then
		ifdown netkeeper
	fi
done