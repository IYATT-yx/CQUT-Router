#!/bin/sh

#Check PPPoE-Server
if [ -z "$(opkg list-installed | grep "rp-pppoe-server")" ]
then
	echo "Please install PPPoE-Server first"
	exit 0
fi

#change log location & enable debug & show password
sed -i "s/\/dev\/null/\/tmp\/pppoe.log/" /etc/ppp/options
sed -i "s/#debug/debug/" /etc/ppp/options
echo "show-password" >> /etc/ppp/options

cp /root/rp-pppoe.so /etc/ppp/plugins/rp-pppoe.so

#set network
uci delete network.wan6
uci commit network

uci set network.netkeeper=interface
uci set network.netkeeper.ifname=$(uci show network.wan.ifname | awk -F "'" '{print $2}')
uci set network.netkeeper.proto=pppoe
uci set network.netkeeper.username=""
uci set network.netkeeper.password=""
uci set network.netkeeper.metric='0'
uci set network.netkeeper.auto='1'
# 将 lan 的 MAC 用于拨号
# uci set network.wan_eth0_2_dev.macaddr=$(ifconfig | grep 'br-lan' | awk '{print $5}')
# 将 wlan0 的 MAC 用于拨号
# uci set network.wan_eth0_2_dev.macaddr=$(ifconfig | grep 'wlan0' | awk '{print $5}')
uci commit network

#set firewall
uci set firewall.@zone[1].network='wan netkeeper' 
uci commit firewall
/etc/init.d/firewall restart
/etc/init.d/network reload
/etc/init.d/network restart

#enable \r in PPPoE
sed -i '/proto_run_command/i username=`echo -e "$username"`' /lib/netifd/proto/ppp.sh

#set init script
cp /root/nk /etc/init.d/nk
chmod +x /etc/init.d/nk
/etc/init.d/nk enable
sleep 5
(/etc/init.d/nk start &)
