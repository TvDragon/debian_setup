#!/bin/sh

# Manual (root user)
# su -
# usermod -aG sudo username
# apt install sudo
# Manual (username user)
# sudo apt update && sudo apt upgrade -y
# sudo apt install bspwm polybar sxhkd pulseaudio pavucontrol thunar rofi suckless-tools picom xfce4-terminal lxpolkit feh -y # suckless-tools = dmenu, lxpolkit = xfce-polkit (not on debian)
# sudo apt install lxappearance -y
# sudo apt install network-manager -y	# Network Manager and NM Gui
# sudo apt install git -y
# git clone https://github.com/TvDragon/debian_setup_test

# Desktop Setup
cd
mkdir .config
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/wallpapers
mv debian_setup_test/wallpapers/* ~/Pictures/wallpapers/
mv debian_setup_test/dotconfigs/* ~/.config/
mv debian_setup_test/.xinitrc ~/.
chmod +x ~/.config/polybar/launch.sh
sudo apt install sddm -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target

# Install applications
sudo apt install nano vim -y
