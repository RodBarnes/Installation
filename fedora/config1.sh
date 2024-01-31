#!/usr/bin/env bash
#v1.0

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

# Setup dnf for fastest mirror usage
sudo dnf config-manager --setopt=fastestmirror=True --save

# Remove uneeded software
sudo dnf remove -y thunderb*
sudo dnf remove -y firefox*

# Cleanup
sudo dnf clean all

# Update Software
sudo dnf update
sudo dnf upgrade -y

