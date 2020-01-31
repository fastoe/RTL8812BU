# Driver for RTL8812BU(RTL88x2BU) WiFi Adaptors

## DKMS installation

```bash
sudo apt update
git clone https://github.com/fastoe/RTL8812BU.git
sudo dkms add ./RTL8812BU/rtl88x2BU_WiFi_linux_v5.3.1_27678.20180430_COEX20180427-5959
sudo dkms install -m rtl88x2bu -v 5.3.1
sudo modprobe 88x2bu
sudo reboot
```