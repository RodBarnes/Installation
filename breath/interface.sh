#!/usr/bin/env bash

THEME='Yaru-dark'
HRFMT='12h'

# Keyboard settings
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20

# Interface theme
gsettings set org.gnome.desktop.interface clock-format $HRFMT
gsettings set org.gnome.desktop.interface gtk-theme $THEME
gsettings set org.gnome.gedit.preferences.editor scheme $THEME
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

# Set favorites
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'brave-browser.desktop', 'org.gnome.gedit.desktop', 'yelp.desktop']"

