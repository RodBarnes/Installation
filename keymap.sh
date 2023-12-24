#!/usr/bin/env bash
#v1.0

FROM="$(dirname $0)"

sudo cp -n /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc.org
sudo cp $FROM/xkb/xkb.chromebook /usr/share/X11/xkb/symbols/pc

# Make the Search key a Caps_Lock key
# Backup the default event definitions and copy in the new one
sudo cp -n /usr/share/X11/xkb/keycodes/evdev /usr/share/X11/xkb/keycodes/evdev.org
sudo cp $FROM/xkb/evdev.chromebook /usr/share/X11/xkb/keycodes/evdev
