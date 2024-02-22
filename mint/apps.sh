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

# Scripts
# cp -r /media/rod/TOOLS/Linux/Scripts /home/rod/Scripts
# chmod +x /home/rod/Scripts/*.sh

# Remove uneeded software
sudo apt remove -y thunderb*
sudo apt remove -y firefox*
sudo apt remove -y warpinator
sudo apt remove -y pix

# Cleanup
sudo apt purge -y --autoremove

# Update Software
sudo apt update
sudo apt upgrade -y

# Add Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt -y install brave-browser

# Add LocalSend
wget -O ~/Downloads/LocalSend-1.13.0-linux-x86-64.deb 'https://github.com/localsend/localsend/releases/download/v1.13.0/LocalSend-1.13.0-linux-x86-64.deb'
sudo apt install -y ~/Downloads/LocalSend-1.13.0-linux-x86-64.deb
rm ~/Downloads/LocalSend-1.13.0-linux-x86-64.deb

# Add Joplin
flatpak install flathub net.cozic.joplin_desktop
#wget -O ~/Downloads/Joplin-2.13.12.AppImage https://objects.joplinusercontent.com/v2.13.12/Joplin-2.13.12.AppImage
#~/Scripts/install_appimage.sh joplin Joplin-2.13.12.AppImage

# Additional software
sudo apt install -y htop procinfo hwinfo lsscsi
sudo apt install -y dconf-editor
sudo apt install -y gparted
sudo apt install -y micro
sudo apt install -y vlc
sudo apt install -y nemo-image-converter
