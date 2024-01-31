#!/usr/bin/env bash

DIR=$(dirname $(readlink -f $0))
#echo "DIR=${DIR}"

source ${DIR}/colors.sh
function printx {
  printf "${YELLOW}$1${NOCOLOR}\n"
}

if [[ "$EUID" = 0 ]]; then
  printx "This must be run as the standard user that will use the device.\nIt will prompt for sudo when it is needed.\n"
  exit
fi

# Connect WiFi
printx "Connect WiFi..."
source ${DIR}/wifi.sh

# Set locale &  timeone
printx "Set time and locale..."
source ${DIR}/localization.sh

# Interface settings
printx "Set up the desktop..."
source ${DIR}/interface.sh

# Scripts
printx "Copying scripts..."
source ${DIR}/leds.sh

# Sleep state
printx "Reset sleep states..."
source ${DIR}/sleep.sh

# Add/Remove Software
printx "Update software..."
source ${DIR}/add.sh
source ${DIR}/browser.sh
source ${DIR}/remove.sh

# Copy over test files
cp /media/rod/TOOLS/*.mp3 ~/Music/

# Setup audio
if [[ ! -v NO_AUDIO ]]; then
  echo "Set up audio..."
  apl-sof-setup-audio
else
  echo "Skipped audio setup"
fi
