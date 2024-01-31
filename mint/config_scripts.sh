#!/usr/bin/env bash
#v1.00

# Get the current directory where this script resides
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

# Copy the scripts, make them executable, then move then to /usr/local/bin
sudo mkdir /tmp/TOOL_SCRIPTS
sudo cp ${DIR}/../../Scripts/* /tmp/TOOL_SCRIPTS
sudo chmod +x /tmp/TOOL_SCRIPTS/*
sudo mv /tmp/TOOL_SCRIPTS/* /usr/local/bin
sudo rmdir /tmp/TOOL_SCRIPTS


