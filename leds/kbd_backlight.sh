#!/usr/bin/env bash

if [[ $# < 1 ]]; then
  OUTPUT=$(brightnessctl --device 'chromeos::kbd_backlight')
  VALUES=($(echo "${OUTPUT}" | grep -Eo '[0-9]+'))
  echo -e "Current: ${VALUES[0]} (${VALUES[1]}%); Maximum: ${VALUES[2]}\n"
else
  brightnessctl --quiet --device 'chromeos::kbd_backlight' set $1
fi

