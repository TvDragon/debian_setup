#!/bin/sh

# Manually typed in CLI
# Manual (root user)
# su -
# usermod -aG sudo username
# apt install sudo
# Manual (username user)
# sudo apt update && sudo apt upgrade -y
# sudo apt install git -y
# git clone https://github.com/TvDragon/debian_setup

# Desktop Setup
sudo apt install bspwm polybar sxhkd pulseaudio pavucontrol thunar rofi suckless-tools picom xfce4-terminal lxpolkit feh lxappearance -y # suckless-tools = dmenu, lxpolkit = xfce-polkit (not on debian)
sudo apt install network-manager -y	# Network Manager and NM Gui
cd
mkdir .config
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/wallpapers
mv debian_setup/wallpapers/* ~/Pictures/wallpapers/
mv debian_setup/dotconfigs/* ~/.config/
mv debian_setup/.xinitrc ~/.
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
sudo apt install sddm -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

# Install applications
cd
cd Downloads/
sudo apt install nano vim -y
# Install build-essentials for GCC/G++ compiler and make
sudo apt install build-essential -y
# Install java
sudo apt install openjdk-17-jdk -y
# Install vscode
sudo apt install curl apt-transport-https -y
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install code -y
# Install sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https -y
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text -y
# Install gparted, timeshift, krita, gimp, mate-calculator
sudo apt install gparted timeshift krita gimp mate-calc -y
# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y
# Install typora
sudo apt install software-properties-common -y
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt update
sudo apt install typora -y
# Install discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
dpkg-deb -x discord.deb unpack
dpkg-deb --control discord.deb unpack/DEBIAN
sed -i 's/libappindicator1/libayatana-appindicator3-1/g' ./unpack/DEBIAN/control
dpkg -b unpack discord.deb
sudo apt install ./discord.deb -y
# Install onlyoffice
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
echo 'deb https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list
sudo apt update && sudo apt install onlyoffice-desktopeditors -y
# Install zoom
wget https://zoom.us/client/latest/zoom_amd64.debsudo apt dpkg -i ./zoom_amd64.deb
# Install pip3
sudo apt install python3-pip -y
# Install pip libraries - flask, pygame
pip3 install flask pygame
# Install SDL2 Libraries
sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev -y
# Install neofetch
sudo apt install neofetch -y
# Install sqlitebrowser
sudo apt install sqlitebrowser -y
# Install sdk
cd
sudo apt install curl unzip zip -y
curl -s "http://get.sdkman.io" | bash
# Needs to manually be typed below
source "$HOME/.sdkman/bin/sdkman-init.sh"
# Install gradle
sdk install gradle 7.4
sdk use gradle 7.4
# Delete all directories and files in Downloads folder
cd ~/Downloads/
rm -r *

