#!/usr/bin/env bash

for iface in $(iw dev | awk '/Interface/{print $2}'); do
    ssid=$(iw dev "$iface" link 2>/dev/null | awk '/SSID:/{print $2; exit}')
    if [ -n "$ssid" ]; then
        echo "$ssid"
        exit
    fi
done
