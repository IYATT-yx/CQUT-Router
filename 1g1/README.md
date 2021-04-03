# 路由器:
1g1  
K2 / newifi3
openWrt 19.07.7  

# 1.下载固件准备
#### (1) 固件下载  
 [K2](openwrt-19.07.7-ramips-mt7620-psg1218a-squashfs-sysupgrade.bin)  
[newifi3](openwrt-newifi-d2-sysupgrade-v19.07.7.bin)

#### (2) 上传固件: 略
管理地址: 192.168.1.1
初始无密码,直接登录
![在这里插入图片描述](1.png)


#### (3) 路由器需要有网(WAN口联网),方便用opkg安装软件

###### [1] 打开PowerShell,执行命令连接
```bash
ssh root@192.168.1.1
```
![在这里插入图片描述](2.png)

###### [2] [换源点我](https://blog.csdn.net/weixin_45579994/article/details/112381181)

更新索引
```bash
opkg update
```

###### [3] 安装中文语言包
```bash
opkg install luci-i18n-base-zh-cn
```

# 2.配置闪讯
#### (1) 下载脚本
[nk](nk)
#### (2) 可以使用Windows的scp命令把三个文件传到路由器的 /root 下
```bash
scp [要上传的文件路径] root@192.168.1.1:/root/
```
![在这里插入图片描述](3.png)

#### (3) 安装pppoe server
```bash
opkg install rp-pppoe-server
```

#### (4) 运行
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