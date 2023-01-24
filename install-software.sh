#!/bin/sh

# This is a list of applications and software that I use which I install through a script.
# This script doesn't need to be run.

# Install applications
cd
cd Downloads/
# Install firmware drivers for intel and qualcomm atheros wireless cards
sudo apt install firmware-iwlwifi -y
sudo apt install firmware-atheros -y
# Setup bluetooth
sudo apt-get install bluez* -y
sudo apt-get install blueman -y
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
# Install nvidia-drivers
sudo apt install nvidia-detect -y
sudo apt install nvidia-driver -y
# Install cli-visualizer
# cd ~/Downloads/
# export TERM=rxvt-256color
# sudo apt-get install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool cmake -y
# git clone https://github.com/dpayne/cli-visualizer.git
# cd cli-visualizer
# ./install.sh
# Install text editors
sudo apt install nano vim -y
# Install build-essentials for GCC/G++ compiler and make
sudo apt install build-essential valgrind -y
# Install java
sudo apt install openjdk-17-jdk -y
# Install vscode
sudo apt install curl apt-transport-https -y
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install code -y
# # Install sublime-text
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# sudo apt install apt-transport-https -y
# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo apt update
# sudo apt install sublime-text -y
# # Install timeshift, krita, gimp
# sudo apt install timeshift krita gimp -y
# Install gparted
sudo apt install gparted
# Install mate-calculator
sudo apt install mate-calc -y
# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
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
sudo echo "deb https://download.onlyoffice.com/repo/debian squeeze main" | sudo tee /etc/apt/sources.list.d/onlyoffice.list
sudo apt update && sudo apt install onlyoffice-desktopeditors -y
# Install zoom
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb -y
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
# Install firefox
sudo apt install firefox-esr -y
# Install evince pdf viewer
sudo apt install evince -y
# Install task manager
sudo apt install xfce4-taskmanager -y
# Install qemu+kvm virt-manager
# sudo apt install virt-manager qemu qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils ebtables -y
# sudo systemctl enable libvirtd
# sudo usermod -aG sudo libvirt-qemu	# Add libvirtd to sudo group
# sudo usermod -aG libvirt tvdragon	# Add tvdragon to libvirtd group
# Install ranger and ueberzug for image preview
sudo apt install ranger ueberzug -y
# Install redshift
sudo apt install redshift -y
# Install sdk
cd
sudo apt install curl unzip zip -y
curl -s "http://get.sdkman.io" | bash
# Needs to manually be typed below
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# # Install gradle
# sdk install gradle 7.4
# sdk use gradle 7.4
# Delete all directories and files in Downloads folder
cd ~/Downloads/
rm -r *
