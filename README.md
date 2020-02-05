# Realtek 8812BU driver for Linux

Driver for 802.11ac USB adapter with RTL8812BU chipset, only STA/Monitor mode is supported, no AP mode.

A few known wireless cards that use this driver include:
* [Fastoe AC1200 USB Wi-Fi Adapter](https://www.amazon.com/1200Mbps-Adapter-Desktop-ChromeBook-macOS10-6-10-15/dp/B081TGWCVB/ref=sr_1_7?keywords=usb_wifi_adapter&qid=1580890540&sr=8-7)

Currently tested with Linux kernel 4.12.14/4.15.0/5.3.0 on X86_64 platform **only**.

### DKMS install

```bash
sudo apt update
sudo apt -y install git dkms
git clone https://github.com/fastoe/RTL8812BU.git
sudo dkms add ./RTL8812BU/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960
sudo dkms install -m rtl88x2bu -v 5.3.1
sudo modprobe 88x2bu
sudo reboot
```

### Manual install

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
wget https://www.fastoe.com/download/driver/RTL8812BU/linux/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960.tar.gz
cd RTL8812BU\rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20200205-5960
make
sudo make install
sudo reboot
```

Enjoy!