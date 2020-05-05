# Realtek 8812BU Driver for Linux

Driver for 802.11ac USB adapter with RTL8812BU chipset, only STA/Monitor mode is supported, no AP mode.

A few known wireless cards that use this driver include:
* [Fastoe AC1200 USB Wi-Fi Adapter](https://www.amazon.com/1200Mbps-ChromeBook-802-11ac-Compatible-Raspbian/dp/B081TGWCVB/ref=as_li_ss_tl?m=A9879GOT1YWJ2&marketplaceID=ATVPDKIKX0DER&qid=1581225299&s=merchant-items&sr=1-3&linkCode=ll1&tag=fastoe-20&linkId=5648949a51280f0323dd599dc27dbae4&language=en_US)

Currently tested with Linux kernel 4.12.14/4.15.0/5.3.0 on X86_64 platform **only**.

### DKMS installation

```bash
sudo apt update
sudo apt -y install git dkms
git clone https://github.com/fastoe/RTL8812BU.git
sudo dkms add ./RTL8812BU/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960
sudo dkms install -m rtl88x2bu -v 5.3.1
sudo modprobe 88x2bu
sudo reboot
```

### Manual installation

To build, you have to retrieve source and run `make`.
If via Git, do following:

```bash
git clone https://github.com/fastoe/RTL8812BU.git
cd RTL8812BU\rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960
make
sudo make install
sudo reboot
```

Or via tarball, do:

```bash
wget https://github.com/fastoe/RTL8812BU/releases/download/20200414/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960.tar.gz
tar -zxvf rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960.tar.gz
cd RTL8812BU\rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960
make
sudo make install
sudo reboot
```

For setting monitor mode:

```bash
vi ./Makefile
72 "CONFIG_80211W = n" -> "CONFIG_80211W = y"
76 "CONFIG_WIFI_MONITOR = n" -> "CONFIG_WIFI_MONITOR = y"
make
sudo make install
sudo ifconfig wlx1cbfcea97791 down
sudo iwconfig wlx1cbfcea97791 mode monitor
sudo ifconfig wlx1cbfcea97791 up
```

Enjoy!
