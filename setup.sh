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

# Change to testing branch
yes | sudo cp -f sources.list /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y
sudo apt install nala -y
# Desktop Setup
sudo nala install libnotify-bin notify-osd dunst -y
sudo nala install bspwm polybar sxhkd pulseaudio pavucontrol thunar rofi suckless-tools picom xfce4-terminal policykit-1-gnome feh lxappearance -y # suckless-tools = dmenu, policykit
sudo nala install network-manager -y	# Network Manager and NM Gui
sudo nala install neovim -y # Neovim
sudo nala install curl -y	# Curl
# Neovim autoload directory
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Install Node.js and npm for CocInstal neovim plugins
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm install --lts
# Install universal ctags for neovim tagbar code navigation
sudo nala install universal-ctags -y
# Make directory so applications like spotify can be opened using rofi
sudo mkdir /usr/share/desktop-directories/
# Copy directories over
cd
mkdir .config .icons .themes .fonts
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/Wallpapers
cp -r debian_setup/Wallpapers/* ~/Pictures/Wallpapers/
cp -r debian_setup/dotconfigs/* ~/.config/
cp -r debian_setup/icons/* ~/.icons/
cp -r debian_setup/themes/* ~/.themes/
cp -r debian_setup/fonts/* ~/.fonts/
cp debian_setup/.xinitrc ~/.
cp debian_setup/.vimrc ~/.
sudo cp -r debian_setup/terminal_themes/* /usr/share/xfce4/terminal/colorschemes/
cp -r debian_setup/nvim_plugged/* ~/.local/share/nvim/plugged/
sudo mkdir /boot/grub/themes
sudo cp -r debian_setup/grub_themes/* /boot/grub/themes/
sudo cp debian_setup/grub /etc/default/grub
sudo nala install grub -y
sudo update-grub
sudo os-prober
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
# Install display manager
sudo nala install lightdm -y
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target
