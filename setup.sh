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
mkdir .config .icons .themes .fonts
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/wallpapers
mv debian_setup/wallpapers/* ~/Pictures/wallpapers/
mv debian_setup/dotconfigs/* ~/.config/
mv debian_setup/icons/* ~/.icons/
mv debian_setup/themes/* ~/.themes/
mv debian_setup/fonts/* ~/.fonts/
mv debian_setup/.xinitrc ~/.
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
sudo apt install sddm -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target