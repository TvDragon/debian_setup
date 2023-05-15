#!/bin/sh

# This is a list of applications and software that I use which I install through a script.
# This script doesn't need to be run.

# Install applications
cd
cd Downloads/
# Install Nala
curl -O nala-legacy_0.11.0.deb https://deb.volian.org/volian/pool/main/n/nala-legacy/nala-legacy_0.11.0_amd64.deb
sudo apt install ./nala-legacy_0.11.0.deb -y
# Install firmware drivers for intel and qualcomm atheros wireless cards
sudo nala install firmware-iwlwifi -y
sudo nala install firmware-atheros -y
# Setup bluetooth
sudo nala-get install bluez* -y
sudo nala-get install blueman -y
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
# Install nvidia-drivers
sudo nala install nvidia-detect -y
sudo nala install nvidia-driver -y
# Install text editors
sudo nala install nano vim -y
# Install build-essentials for GCC/G++ compiler and make
sudo nala install build-essential valgrind -y
# Install java
sudo nala install openjdk-17-jdk -y
# Install vscode
wget -O code.deb "https://code.visualstudio.com/docs/?dv=linux64_deb"
sudo nala install ./code.deb -y
# Install timeshift, krita, gimp
sudo nala install timeshift krita gimp -y
# Install gparted
sudo nala install gparted
# Install mate-calculator
sudo nala install mate-calc -y
# Install spotify
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo nala update
sudo nala install spotify-client -y
# Install typora
sudo nala install software-properties-common -y
wget -qO - https://typoraio.cn/linux/public-key.asc | sudo tee /etc/apt/trusted.gpg.d/typora.asc
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo nala update
sudo nala install typora -y
# Install discord
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
dpkg-deb -x discord.deb unpack
dpkg-deb --control discord.deb unpack/DEBIAN
sed -i 's/libappindicator1/libayatana-appindicator3-1/g' ./unpack/DEBIAN/control
dpkg -b unpack discord.deb
sudo nala install ./discord.deb -y
# Install onlyoffice
wget -O onlyoffice-desktop.deb "https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb"
sudo nala install onlyoffice-desktop.deb -y
# Install zoom
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo nala install ./zoom_amd64.deb -y
# Install pip3
sudo nala install python3-pip -y
# Install pip libraries - flask, pygame
pip3 install flask pygame
# Install SDL2 Libraries
sudo nala install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev -y
# Install neofetch
sudo nala install neofetch -y
# Install sqlitebrowser
sudo nala install sqlitebrowser -y
# Install firefox non-esr
sudo mkdir /etc/apt/keyrings/
sudo gpg --keyserver keyserver.ubuntu.com --recv-keys 2667CA5C
sudo gpg -ao ~/ubuntuzilla.gpg --export 2667CA5C
cat ubuntuzilla.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/ubuntuzilla.gpg
sudo rm ~/ubuntuzilla.gpg
echo "deb [signed-by=/etc/apt/keyrings/ubuntuzilla.gpg] http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main" | sudo tee /etc/apt/sources.list.d/ubuntuzilla.list > /dev/null
sudo nala update
sudo nala install firefox-mozilla-build -y
# Install evince pdf viewer
sudo nala install evince -y
# Install task manager
sudo nala install xfce4-taskmanager -y
# Install qemu+kvm virt-manager
# sudo nala install virt-manager qemu qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils ebtables -y
# sudo systemctl enable libvirtd
# sudo usermod -aG sudo libvirt-qemu	# Add libvirtd to sudo group
# sudo usermod -aG libvirt tvdragon	# Add tvdragon to libvirtd group
# Install ranger and ueberzug for image preview
sudo nala install ranger ueberzug -y
# Install redshift
sudo nala install redshift -y
# Install sdk
cd
sudo nala install curl unzip zip -y
curl -s "http://get.sdkman.io" | bash
# Needs to manually be typed below
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# # Install gradle
# sdk install gradle 7.4
# sdk use gradle 7.4
# Delete all directories and files in Downloads folder
cd ~/Downloads/
rm -r *
