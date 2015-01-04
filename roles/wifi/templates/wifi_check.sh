#!/bin/sh

# {{ ansible_managed }}

keepalive_host='{{ pi_gateway }}'

ping -q -c1 $keepalive_host >> /dev/null

if [ "$?" -ne "0" ]; then
  echo "`date` WIFI DOWN" >> /var/log/wifi.log
  ifdown wlan0
  rmmod 8192cu
  modprobe 8192cu
  ifup wlan0
  echo "`date` WIFI UP" >> /var/log/wifi.log
fi
