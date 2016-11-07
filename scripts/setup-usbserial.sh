#!/bin/bash
source "/vagrant/scripts/common.sh"

function installUSBSERIAL {
        apt-get install -y linux-source-4.4.0
        cd /usr/src
        tar jxf linux-source-4.4.0.tar.bz2
        cd /usr/src/linux-source-4.4.0/drivers/usb/serial
        make -C /usr/src/linux-headers-4.4.0-45-generic  M=`pwd` modules
        mkdir -p /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial
        cp usbserial.ko /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial/usbserial.ko
        insmod /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial/usbserial.ko
}

function installCP210X {
        cd /root
        wget http://www.silabs.com/Support%20Documents/Software/Linux_3.x.x_VCP_Driver_Source.zip
        unzip Linux_3.x.x_VCP_Driver_Source.zip
        cd Linux_3.x.x_VCP_Driver_Source
        make
        cp cp210x.ko /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial/cp210x.ko
        insmod /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial/cp210x.ko
}
echo "Setup USB2Serial modules"
installUSBSERIAL
installCP210X
