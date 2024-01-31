#!/usr/bin/env bash

### Remove Snap
# Stop the daemon
sudo systemctl stop snapd && sudo systemctl disable snapd

# Uninstall
sudo apt purge -y snapd

# Stop it from being reinstalled by 'mistake' when installing other packages
cat << EOF > no-snap.pref
  Package: snapd
  Pin: release a=*
  Pin-Priority: -10
EOF

sudo mv no-snap.pref /etc/apt/preferences.d/
sudo chown root:root /etc/apt/preferences.d/no-snap.pref

# Remove Apps
sudo apt remove -y unattended-upgrades
sudo apt remove -y thunderbird gnome-calendar
sudo apt remove -y simple-scan gnome-todo cheese
sudo apt remove -y aisleriot gnome-mahjongg gnome-mines gnome-sudoku

# Cleanup
sudo apt purge -y --autoremove
