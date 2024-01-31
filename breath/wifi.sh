#!/usr/bin/env bash

SSID=HOMEBASE5
PSWD='h0m3B!s#b*rn3S'

if [[ $(nmcli connection show | wc -l) -eq 1 ]]; then
  # Connect WiFi
  nmcli d wifi connect $SSID password $PSWD
fi
