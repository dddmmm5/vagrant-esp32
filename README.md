Vagrant for ESP32 IoT development Framework.
--------------------------------------------

## What is for?

* Vagrant VM for Espressif ESP32 IDF Environment. 
* `xtensa-esp32-linux64-1.22.0-59` tool chain included.
* Also `cp210x` USB to UART driver included.

## Vagrant Up!

* On provision, automatically download and install `usbserial.ko` and `cp210x.ko`. but after reboot(`vagrant up` after `vagrant halt`), should insert kernel modules manually. This will be fixed.
```
$ sudo insmod /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial/usbserial.ko 
$ sudo insmod /lib/modules/4.4.0-45-generic/kernel/drivers/usb/serial/cp210x.ko
```

## Attaching USB

* On the host, list vm UUID.
```
$ VBoxManage list runningvms
```
 * Find `"esp32-idf" {UUID}` and get UUID.

* On the host, list USB device UUID.
```
$ VBoxManage list usbhost
```
 * Find your `USB to UART Bridge Controller` and get UUID. 

* Attach USB to VM
```
$ VBoxManage controlvm [VM_UUID] usbattach [USB_UUID]
```

* Or just use `gui` and attach with your mouse. Uncomment `vb.gui=true` in `Vagrantfile`.
```
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.name = "esp32-idf"
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.memory = "4096"
    vb.customize ["modifyvm", :id, "--usbehci", "on"]
    vb.customize ["modifyvm", :id, "--usb", "on"]
  end
```

## Known issue

* Download logic for `xtensa-esp32-linux64-1.22.0-59.tar.gz` is broken. Just pre-download and put it into `resources/xtensa-esp32-linux64-1.22.0-59.tar.gz`. 