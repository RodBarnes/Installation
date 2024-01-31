#!/usr/bin/env bash

# Update Software
sudo apt update
sudo apt upgrade -y

# Additional software
sudo apt install -y procinfo hwinfo lshw dmidecode inxi lsscsi
sudo apt install -y net-tools
sudo apt install -y brightnessctl
sudo apt install -y gnome-software dconf-editor
sudo apt install -y pavucontrol
sudo apt install -y exfat-fuse
sudo apt install -y exfat-utils
sudo apt install -y exfatprogs
