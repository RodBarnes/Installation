#!/usr/bin/env bash
#v1.00

DIR=$(dirname $(readlink -f $0))
#echo "DIR=${DIR}"

if [[ "$EUID" = 0 ]]; then
  echo "This must be run as the standard user that will use the device.\nIt will prompt for sudo when it is needed."
  exit
fi

# Copy the scripts, make them executable, then move then to /usr/local/bin
sudo mkdir /tmp/TOOL_SCRIPTS
sudo cp bin/* /tmp/TOOL_SCRIPTS
sudo chmod +x /tmp/TOOL_SCRIPTS/*
sudo chgrp root /tmp/TOOL_SCRIPTS/*
sudo chown root /tmp/TOOL_SCRIPTS/*
sudo mv /tmp/TOOL_SCRIPTS/* /usr/local/bin
sudo rmdir /tmp/TOOL_SCRIPTS
