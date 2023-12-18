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

# Remove uneeded software
sudo apt remove -y thunderb*
sudo apt remove -y firefox*
sudo apt remove -y warpinator

# Cleanup
sudo apt purge -y --autoremove

# Update Software
sudo apt update
sudo apt upgrade -y

