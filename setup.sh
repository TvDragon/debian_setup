#!/bin/sh

# Manually typed in CLI
# Manual (root user)
# su -
# usermod -aG sudo username
# apt install sudo
# Manual (username user)
# sudo apt update && sudo apt upgrade -y
# sudo apt install git -y
# git clone https://github.com/TvDragon/polar_space

# Desktop Setup
sudo apt install libnotify-bin notify-osd dunst -y
sudo apt install bspwm polybar sxhkd pulseaudio pavucontrol thunar rofi suckless-tools picom xfce4-terminal lxpolkit feh lxappearance -y # suckless-tools = dmenu, lxpolkit = xfce-polkit (not on debian)
sudo apt install network-manager -y	# Network Manager and NM Gui
# Make directory so applications like spotify can be opened using rofi
sudo mkdir /usr/share/desktop-directories/
# Copy directories over
cd
mkdir .config .icons .themes .fonts
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/Wallpapers
mv polar_space/Wallpapers/* ~/Pictures/Wallpapers/
mv polar_space/dotconfigs/* ~/.config/
mv polar_space/icons/* ~/.icons/
mv polar_space/themes/* ~/.themes/
mv polar_space/fonts/* ~/.fonts/
mv polar_space/.xinitrc ~/.
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
# Install firmware drivers for intel wireless cards
sudo apt install firmware-iwlwifi -y
# Install nvidia-drivers
sudo apt install nvidia-detect -y
sudo apt install nvidia-driver -y
# Install cli-visualizer
cd ~/Downloads/
export TERM=rxvt-256color
sudo apt-get install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool cmake -y
git clone https://github.com/dpayne/cli-visualizer.git
cd cli-visualizer
./install.sh
# Install login manager
sudo apt install sddm -y
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
