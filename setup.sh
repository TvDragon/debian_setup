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

# Setting sources.list
sudo apt update && sudo apt upgrade -y
sudo apt install nala -y
# Install Essentail Programs
sudo nala install libnotify-bin notify-osd dunst -y
sudo nala install bspwm polybar sxhkd pulseaudio pavucontrol thunar rofi suckless-tools picom xfce4-terminal policykit-1-gnome feh lxappearance -y # suckless-tools = dmenu, policykit
sudo nala install network-manager network-manger-gnome -y	# Network Manager and NM Gui
sudo nala install curl unzip -y	# Curl and Unzip
# Install other less important programs
sudo nala install neovim -y # Neovim
# Neovim autoload directory
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Install Node.js and npm for CocInstal neovim plugins
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
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
cp -r debian_setup/doticons/* ~/.icons/
wget https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.0.1/gruvbox-plus-icon-pack-5.0.1.zip
unzip gruvbox-plus-icon-pack-5.0.1.zip -d ~/.icons/
git clone https://www.opencode.net/adhe/gruvboxplasma.git
cp -r gruvboxplasma/icons/Gruvbox ~/.icons/
cp -r debian_setup/dotthemes/* ~/.themes/
cp -r debian_setup/dotfonts/* ~/.fonts/
sudo cp debian_setup/desktop_icons/* /usr/share/applications/
cp debian_setup/.xinitrc ~/.
cp debian_setup/.vimrc ~/.
sudo cp -r debian_setup/terminal_themes/* /usr/share/xfce4/terminal/colorschemes/
#sudo mkdir /boot/grub/themes
#sudo cp -r debian_setup/grub_themes/* /boot/grub/themes/
#sudo cp debian_setup/grub /etc/default/grub
sudo update-grub
sudo os-prober
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
# Install display manager
sudo nala install lightdm -y
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target
