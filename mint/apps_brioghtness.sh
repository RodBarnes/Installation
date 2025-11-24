#!/usr/bin/env bash
#v1.0

DIR=$(dirname $(readlink -f $0))
#echo "DIR=${DIR}"

if [[ "$EUID" = 0 ]]; then
  echo "This must be run as the standard user that will use the device.\nIt will prompt for sudo when it is needed."
  exit
fi

# Additional software
sudo apt install -y brightnessctl

