#!/usr/bin/env bash
#v1.01

FROM="$(dirname $0)"

# Add the key symbols to support the dedicated XF86* keys; e.g., screen brightness, audio, etc.
# Backup the default symbol table and copy in the new one
sudo cp -n /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc.org
sudo cp $FROM/xkb/xkb.chromebook /usr/share/X11/xkb/symbols/pc

# Make the Search key a Caps_Lock key
# Backup the default event definitions and copy in the new one
sudo cp -n /usr/share/X11/xkb/keycodes/evdev /usr/share/X11/xkb/keycodes/evdev.org
sudo cp $FROM/xkb/evdev.chromebook /usr/share/X11/xkb/keycodes/evdev
