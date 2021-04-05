# 路由器:
1g1  
K2 / newifi3  
openWrt 19.07.7  

固件  
 [K2](openwrt-19.07.7-ramips-mt7620-psg1218a-squashfs-sysupgrade.bin)  
[newifi3](openwrt-newifi-d2-sysupgrade-v19.07.7.bin)


[换源点我](https://blog.csdn.net/weixin_45579994/article/details/112381181)

更新索引
```bash
opkg update
```

安装中文语言包
```bash
opkg install luci-i18n-base-zh-cn
```

下载脚本,上传到/root  
[nk](nk)


安装pppoe server
```bash
opkg install rp-pppoe-server
```

运行
```bash
sh /root/nk4conf.sh
```

# 功能扩展
#### (1) 客户端限速
```bash
opkg install luci-app-nft-qos
```
```bash
opkg install luci-i18n-nft-qos-zh-cn
```