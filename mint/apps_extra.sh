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

# Additional software
sudo apt install -y cmake
sudo apt install -y picard
sudo apt install -y sound-juicer
sudo apt install -y ffmpeg
sudo apt install -y pdftk-java
sudo apt install -y vlc
sudo apt install -y dconf-editor
sudo apt install -y nemo-image-converter
sudo apt install -y nemo-gtkhash
