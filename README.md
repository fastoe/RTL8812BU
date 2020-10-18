# Realtek RTL8812BU Driver for Linux

Driver for 802.11ac USB adapter with RTL8812BU chipset, only STA/Monitor mode is supported, no AP mode.

A few known wireless cards that use this driver include:
* [Fastoe AC1200 USB Wi-Fi Adapter](https://www.amazon.com/1200Mbps-ChromeBook-802-11ac-Compatible-Raspbian/dp/B081TGWCVB/ref=as_li_ss_tl?m=A9879GOT1YWJ2&marketplaceID=ATVPDKIKX0DER&qid=1581225299&s=merchant-items&sr=1-3&linkCode=ll1&tag=fastoe-20&linkId=5648949a51280f0323dd599dc27dbae4&language=en_US)

Currently tested with Linux kernel 4.12.14/4.15.0/5.3.0 on X86_64 platform **only**.

### DKMS installation

```bash
sudo apt update
sudo apt -y install dkms git bc
git clone https://github.com/fastoe/RTL8812BU.git
cd RTL8812BU
VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
sudo rsync -rvhP ./ /usr/src/rtl88x2bu-${VER}
sudo dkms add -m rtl88x2bu -v ${VER}
sudo dkms build -m rtl88x2bu -v ${VER}
sudo dkms install -m rtl88x2bu -v ${VER}
sudo modprobe 88x2bu
sudo reboot
```

For setting monitor mode:

```bash
# configure for monitor mode
sed -i 's/CONFIG_80211W = n/CONFIG_80211W = y/' Makefile
sed -i 's/CONFIG_WIFI_MONITOR = n/CONFIG_WIFI_MONITOR = y/' Makefile

make
sudo make install
sudo ifconfig wlx1cbfcea97791 down
sudo iwconfig wlx1cbfcea97791 mode monitor
sudo ifconfig wlx1cbfcea97791 up
```

![image](https://github.com/fastoe/RTL8812BU/blob/master/8812bu-monitor-mode.png)

Enjoy!
