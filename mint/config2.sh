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

# Additional software
sudo apt install -y git
sudo apt install -y htop procinfo hwinfo lsscsi brightnessctl
sudo apt install -y dconf-editor

# Add localsend
wget -O ./Downloads/LocalSend-1.13.0-linux-x86-64.deb 'https://github.com/localsend/localsend/releases/download/v1.13.0/LocalSend-1.13.0-linux-x86-64.deb'
sudo apt install -y ./Downloads/LocalSend-1.13.0-linux-x86-64.deb
rm ./Downloads/LocalSend-1.13.0-linux-x86-64.deb

# Add Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt -y install brave-browser

# Configure desktop
gsettings set org.cinnamon.theme name 'Mint-Y-Dark-Aqua'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark-Aqua'
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y-Sand'
gsettings set org.cinnamon.desktop.interface clock-use-24h false
gsettings set org.cinnamon.desktop.media-handling automount-open false
gsettings set org.cinnamon panels-height "['1:40']"
gsettings set org.cinnamon panels-autohide "['1:intel']"
gsettings set org.x.apps.portal color-scheme 'prefer-dark'
gsettings set org.nemo.preferences show-computer-icon-toolbar true
gsettings set org.nemo.preferences show-open-in-terminal-toolbar true
gsettings set org.nemo.desktop computer-icon-visible false
gsettings set org.nemo.desktop home-icon-visible false
gsettings set org.nemo.desktop trash-icon-visible false
gsettings set org.nemo.desktop volumes-visible false
gsettings set org.nemo.preferences quick-renames-with-pause-in-between true
gsettings set org.nemo.preferences show-advanced-permissions true
gsettings set org.cinnamon.desktop.privacy remember-recent-files false

# Configure editor preferences
gsettings set org.x.editor.preferences.editor prefer-dark-theme true
gsettings set org.x.editor.preferences.editor scheme 'oblivion'
