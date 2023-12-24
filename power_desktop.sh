#!/usr/bin/env bash
#v1.0

DIR=$(dirname $(readlink -f $0))
#echo "DIR=${DIR}"

source ${DIR}/../colors.sh
function printx {
  printf "${YELLOW}$1${NOCOLOR}\n"
}

if [[ "$EUID" = 0 ]]; then
  printx "This must be run as the standard user that will use the device.\nIt will prompt for sudo when it is needed.\n"
  exit
fi

# Configure power management
gsettings set org.cinnamon.settings-daemon.plugins.power idle-brightness 15
gsettings set org.cinnamon.settings-daemon.plugins.power idle-dim-time 90
gsettings set org.cinnamon.settings-daemon.plugins.power idle-dim-ac false
gsettings set org.cinnamon.settings-daemon.plugins.power button-power 'interactive'
