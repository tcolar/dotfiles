for i in /sys/bus/usb/devices/*/power/control; do echo on > $i; done
