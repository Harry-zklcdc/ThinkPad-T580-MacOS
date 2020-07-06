# 联想ThinkPad T580上的macOS（本指南也适用于P52s,T480 i7-8550u，8250u理论上应该通用，不适用T480s）

此存储库包含10.14,10.15在Lenovo ThinkPad T580上运行macOS（目前为Mojave，Catalina ）的示例配置
--------------------------------------------------------------------------

## 注意
**Clover 将不再更新**, 最新支持版本为 macOS 10.15.5以后。仅更新 OC 引导, 目前 OC 引导完成进度 95%, 可正常使用。

> 使用前请先清除一次 `nvram`

机器配置表和驱动情况
---------
* 联想ThinkPad T580 【4k的UHD显示屏：3840x2160（京东方BOE NV156QUM-N44，非触摸）】

* 英特尔i7-8550U CPU

* 内存16GB RAM DDR4 2400-SODIMM

* Samsung PM981 512GB 更新驱动

* 英特尔以太网I219-V4 有线网卡

* WiFi CF-811AC 外置网卡

* 蓝牙设备芯片组20702B0,固件版本:v150 c9318 已添加驱动固件，可以正常使用

* 瑞昱Realtek ALC3287（“ALC257”）通过AppleALC.kext与layout-id：11，支持耳机和自带喇叭之间插拔自动切换。

* Intel UHD Graphics 620（禁用Nvidia MX150，macOS不支持Optimus）

* ACPI热修补电源管理和双电池状态

* SD卡读卡器走usb3.0通道，需要打开此USB端口即可使用

* Thunderbolt 3【BIOS里需要设置“Thunderbolt BIOS Assist”：Disable，“Security level” :No Security(允许自动连接 Thunderbolt 设备)。这样即可使前端类型USB type-c端口在macOS中工作，可以热插拔， DP / HDMI通过USB type-C：视频工作正常，连接扩展坞正常，雷电3设备工作正常，热插拔正常】

* 机器自带独立的HDMI端口：可以输出4k@30HZ到显示器。连接时会显示音频设备HDMI，并正常使用。

* 键盘Synaptics触摸板（PS / 2）使用ApplePS2SmartTouchPad.kext，EMlyDinEsH的v4.7b5，支持多点触控手势。
* 睡眠和唤醒正常

已禁用的设备和BIOS设置
-----------
* WWAN（无模块）
* TrackPad Synaptics指纹识别器无法驱动
* BIOS里设置Thunderbolt BIOS Assist为Disable，“Security level” :No Security(允许自动连接 Thunderbolt 设备)。
* BIOS里设置usb项Always on USB为enable，下面子项Charge in Battery Mode设置为enable（这样雷电口type-c就可以热插拔type-c外设）
* 关闭安全启动

UEFI BIOS固件修订
-----------
* BIOS版本 1.20,1.21,1.22,1.23通用


目前存在的问题
-------------
* 指纹无法驱动，触摸板还有缺陷。

备注
--------

打开睡眠

```bash
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
sudo pmset -a proximitywake 0
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
```

