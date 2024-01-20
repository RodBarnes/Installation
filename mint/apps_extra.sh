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
sudo apt install -y cmake
sudo apt install -y picard
sudo apt install -y sound-juicer

# Add/configure git
sudo apt install -y git
git config --global user.name "Rod Barnes"
git config --global user.email "advappsw@gmail.com"

# Add yt-dlp
wget -O ~/Downloads/yt-dlp_linux https://github.com/yt-dlp/yt-dlp/releases/download/2023.12.30/yt-dlp_linux
sudo mv ~/Downloads/yt-dlp_linux /usr/local/bin/yt-dlp
sudo chgrp root /usr/local/bin/yt-dlp
sudo chown root /usr/local/bin/yt-dlp
sudo chmod +x /usr/local/bin/yt-dlp

# Add Meld
flatpak install -y flathub org.gnome.meld

# Add Joplin
latpak install flathub net.cozic.joplin_desktop

# Add VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

# Add MoneyDance
wget -O ~/Downloads/moneydance_linux_amd64.deb  https://infinitekind.com/stabledl/current/moneydance_linux_amd64.deb
sudo apt install -y ~/Downloads/moneydance_linux_amd64.deb

# Add Postman
wget -O ~/Downloads/postman-linux-x64.tar.gz https://dl.pstmn.io/download/latest/linux_64
cd /opt
sudo tar xf ~/Downloads/postman-linux-x64.tar.gz
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

# Add Slack
printx "Manually download the slack DEB from this URL 'https://slack.com/downloads/linux'"
sudo apt install ~/Downloads/slack-desktop-4.35.131-amd64.deb

# Add Zoom
wget -O ~/Downloads/zoom_amd64.deb https://zoom.us/client/5.17.1.1840/zoom_amd64.deb
sudo apt install -y ~/Downloads/zoom_amd64.deb

# Add iDrive
wget -O ~/Downloads/idriveforlinux.bin https://www.idrivedownloads.com/downloads/linux/download-for-linux/linux-bin/idriveforlinux.bin
sudo mv /home/rod/Downloads/idriveforlinux.bin /opt
sudo bash /opt/idriveforlinux.bin --install


