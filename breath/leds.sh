#!/usr/env/bin bash

FROM="$(dirname $0)"

# Copy the script to change the backlight
sudo cp $FROM/leds/kbd_backlight.sh /usr/local/bin/kbd_backlight
sudo chmod +x /usr/local/bin/kbd_backlight

# Copy the udev rules
sudo cp $FROM/leds/keyboard-backlight-udev.rules /lib/udev/udev.rules/99-led.rules

# Ensure the leds group exists and the current user is a member
sudo groupadd -g 137 leds
sudo usermod -aG leds $USER

# Add custom keyboard shortcuts for backlight control
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Keyboard Backlight Up'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'kbd_backlight 10+'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary>u'

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Keyboard Backlight Down'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'kbd_backlight 10-'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary>d'
