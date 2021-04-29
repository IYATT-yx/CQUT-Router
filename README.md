# CQUT router
针对重庆理工大学宽带的路由器固件  

_____________________________________________
2021-4-9  
[固件](固件)  
目前编译了斐讯K2和newifi3的固件  
从2.1g1开始集成了使用创翼所需的脚本（基于https://github.com/miao1007/Openwrt-NetKeeper ）和库  
只需要登录管理页面,打开 服务->终端,在里面执行 `sh nk4conf.sh` 即可启用  
方案采用拦截账号,路由器代替创翼拨号

管理页面地址 `192.168.6.1`  
wifi名和密码都是:  iyatt.com  
____________________________________________
2021-4-10

2.14g1 2.15g2 去除adblock
____________________________________________
2021-4-11

2.16g2 去除cshark
____________________________________________
2021-4-11

2.15g1 2.17g2 添加TCP-BBR
____________________________________________
2021-4-11

2.16g1 2.18g2 修改脚本
启用创翼支持命令改为 `sh nkconf.sh`
____________________________________________
____________________________________________
2021-4-21  
分割线  

从此处后，路由器管理系统初始为有密码（暂时不公开，考虑还在学校期间，赚点小钱）  
____________________________________________
____________________________________________
2021-4-29  
分割线  

因为路由器设置过于复杂的初始密码不便于使用（我测试加的 30 位长度的密码），因此放弃，不设置密码。然后计划使用 C 语言开发，代替原有 shell 脚本的功能，性能应该会更好。虽然路由器不再设置密码，但是要启用我的软件需要密码验证。
我克隆下来用于编译固件的 OpenWrt 版本为 21.098（https://github.com/openwrt/openwrt )，该版本基于 [GPL-2.0](https://iyatt.com/license/GPL-2.0.txt ) 开源。我发布的二进制文件（固件）在是原代码上增加 C 程序再构建的，所以应将增加的源代码一起发布（[地址](netkeeper开发)）。
____________________________________________
____________________________________________
