# Realtek RTL8812BU Driver for Linux

[![Build Status](https://travis-ci.com/fastoe/RTL8812BU.svg?branch=master)](https://travis-ci.com/fastoe/RTL8812BU)

Driver for 802.11ac USB adapter with RTL8812BU chipset, only STA/Monitor mode is supported, no AP mode.

A few known wireless cards that use this driver include:
* [Fastoe AC1200 USB Wi-Fi Adapter](https://www.amazon.com/1200Mbps-ChromeBook-802-11ac-Compatible-Raspbian/dp/B081TGWCVB/ref=as_li_ss_tl?m=A9879GOT1YWJ2&marketplaceID=ATVPDKIKX0DER&qid=1581225299&s=merchant-items&sr=1-3&linkCode=ll1&tag=fastoe-20&linkId=5648949a51280f0323dd599dc27dbae4&language=en_US)
* Cudy WU1200 AC1200 High Gain USB Wi-Fi Adapter
* TP-Link Archer T3U
* TP-Link Archer T3U Plus
* TP-Link Archer T4U V3
* Linksys WUSB6400M
* Dlink DWA-181
* Dlink DWA-182
* [DEXP WFA-1301](https://www.dns-shop.ru/product/cd99c844d5383332/wi-fi-adapter-dexp-wfa-1301/)

Currently tested with Linux kernel 4.12.14/4.15.0/5.3.0 on X86_64 platform **only**.

### For Raspberry Pi
* https://github.com/fastoe/RTL8812BU_for_Raspbian


### For kernel 5.11 or later, please clone the v5.8.7 branch:
```bash
clone the new branch:
sudo apt update
sudo apt install -y dkms git bc
git clone -b v5.8.7 https://github.com/fastoe/RTL8812BU.git
cd RTL8812BU
make
sudo make install
sudo reboot
```

### For 5.10 kernel, please clone the v5.6.1 branch:
```bash
clone the new branch:
sudo apt update
sudo apt install -y dkms git bc
git clone -b v5.6.1 https://github.com/fastoe/RTL8812BU.git
cd RTL8812BU
make
sudo make install
sudo reboot
```

### For 5.9 and previous versions:
```bash
clone the new branch:
sudo apt update
sudo apt install -y dkms git bc
git clone https://github.com/fastoe/RTL8812BU.git
cd RTL8812BU
make
sudo make install
sudo reboot
```

For setting monitor mode:

```bash
# configure for monitor mode
sed -i 's/CONFIG_80211W = n/CONFIG_80211W = y/' Makefile
sed -i 's/CONFIG_WIFI_MONITOR = n/CONFIG_WIFI_MONITOR = y/' Makefile

make
sudo make install
sudo ip link set wlx1cbfcea97791 down
sudo iw wlx1cbfcea97791 set monitor none
sudo ip link set wlx1cbfcea97791 up
```

![image](https://www.fastoe.com/images/2020/05/8812bu-monitor-mode.png)

Enjoy!
