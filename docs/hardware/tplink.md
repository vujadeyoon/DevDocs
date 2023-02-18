# TP-Link


## Table of contents
1. [Notice](#notice)
2. [How to select operation mode](#operation_mode)
3. [How to use USB drive](#usb_drive)
4. [Reference](#ref)


## 1. Notice <a name="notice"></a>
- A guide for TP-Link
- I recommend that you should ignore the commented instructions with an octothorpe, #.


## 2. How to select operation mode <a name="operation_mode"></a>
There are two operations mode as below:
1. **Wireless Router Mode**: In this mode, the router can provide internet access for multiple wired and wireless devices. This mode is required most commonly.
2. **Access Point Mode**: In this mode, the router changes an existing wired (Ethernet) network into a wireless one.

You can find the operation mode: *Default Gateway* - *Advanced* - *System* - *Operation Mode* <br/>
<img src=../../asset/hardware/tplink/fig_1.png width="30%"/>


## 3. How to use USB drive <a name="usb_drive"></a>
1. How to connect USB drive into Wi-Fi router <br/>
You can find the setting section for USB storage device: *Default Gateway* - *Advanced* - *USB* - *USB Storage Device* <br/>
<img src=../../asset/hardware/tplink/fig_2.png width="30%"/>

2. How to access the connected USB drive
   1. FTP for Linux
      ```bash
      ftp://${FTP_ADDRESS}:${FTP_PORT}
      ```
   2. Samba for Windows
      ```bash
      Folder:\\${FTP_ADDRESS}
      ```


## 4. Reference <a name="ref"></a>
1. [Archer AX20 & AX1800 V1 User Guide - Chapter 4 Set Up Internet Connection](www.tp-link.com/us/user-guides/archer-ax20&ax1800_v1/chapter-4-set-up-internet-connection)
2. [How to access my USB storage device on the TP-Link Routers from my Android and iOS phone](https://www.tp-link.com/en/support/faq/1198/)
