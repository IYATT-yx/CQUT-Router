# 路由器
2g1  
K2  
openwrt 21.092 (自编译)  

1.下载并自行刷固件  

[K2](openwrt-ramips-mt7620-phicomm_psg1218a-squashfs-sysupgrade.bin)  

2.安装pppoe-server

```bash
opkg update
```

```bash
opkg install rp-pppoe-server
```

3.运行脚本  

[下载](nk)  

上传  
```bash
scp * root@192.168.6.1:/root
```

运行  
```bash
sh /root/nk4conf.sh
```

# 3.功能扩展
#### (1) 客户端限速
```bash
opkg install luci-app-nft-qos
```
```bash
opkg install luci-i18n-nft-qos-zh-cn
```