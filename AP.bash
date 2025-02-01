#!/bin/bash

sudo rfkill unblock wifi
sudo ip link set wlan0 up
nmcli con delete RP4BTEST
nmcli con add type wifi ifname wlan0 mode ap con-name RP4BTEST ssid RP4BTEST autoconnect false
nmcli con modify RP4BTEST 802-11-wireless.band bg
nmcli con modify RP4BTEST 802-11-wireless.channel 3
nmcli con modify RP4BTEST 802-11-wireless.cloned-mac-address 00:12:34:56:78:9a
nmcli con modify RP4BTEST ipv4.method shared ipv4.address 192.168.4.1/24
nmcli con modify RP4BTEST ipv6.method disabled
nmcli con modify RP4BTEST wifi-sec.key-mgmt wpa-psk
nmcli con modify RP4BTEST wifi-sec.psk "pass"
nmcli con up RP4BTEST --ask