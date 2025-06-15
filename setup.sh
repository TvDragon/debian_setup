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

# Ask user if they wish to install BSPWM or XFWM4 as the window manager
read -p "Do you wish to use BSPWM or XFWM4 as your window manager? (1/2) " window_manager

while [ "$window_manager" != "1" ] && [ "$window_manager" != "2" ] ; do
       echo "\nEnter 1 for BSPWM or 2 for XFWM4 as the window manager to install."
       read -p "Do you wish to use BSPWM or XFWM4 as your window manager? (1/2) " window_manager
done

# Update packages
sudo apt update && sudo apt upgrade -y
sudo apt install nala -y
# Install Essential Programs
sudo nala install pulseaudio pavucontrol thunar thunar-archive-plugin \
       network-manager network-manager-gnome xfce4-terminal curl unzip psmisc -y
if [ "$window_manager" = "1" ] ; then
       echo "BSPWM selected"
       sudo nala install bspwm polybar sxhkd rofi libnotify-bin notify-osd dunst \
              suckless-tools i3lock policykit-1-gnome xwallpaper lxappearance -y # suckless-tools = dmenu, policykit
elif [ "$window_manager" = "2" ] ; then
       echo "XFWM4 selected"
       sudo nala install xfwm4 xinit xfce4-settings xfce4-session \
              xfce4-notifyd xfce4-panel xfce4-panel-profiles \
              xfce4-power-manager-plugins xfce4-pulseaudio-plugin \
              xfce4-wavelan-plugin xfce4-whiskermenu-plugin xfce4-windowck-plugin rofi -y
fi

# Install other less important programs
sudo nala install xfce4-taskmanager xfce4-screenshooter ristretto -y
sudo nala install neovim -y # Neovim
# Neovim autoload directory
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Install Node.js and npm for CocInstal neovim plugins
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install --lts
# Install universal ctags for neovim tagbar code navigation
sudo nala install universal-ctags -y
# Remove program not needed
sudo nala remove imagemagick* -y

# Copy directories over
cd
mkdir .config .icons .themes .fonts
mkdir Desktop Downloads Pictures Videos
mkdir Pictures/Wallpapers
cp -r debian_setup/Wallpapers/* ~/Pictures/Wallpapers/
cp -r debian_setup/doticons/* ~/.icons/
wget https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.0.1/gruvbox-plus-icon-pack-5.0.1.zip
unzip gruvbox-plus-icon-pack-5.0.1.zip -d ~/.icons/
git clone https://www.opencode.net/adhe/gruvboxplasma.git
cp -r gruvboxplasma/icons/Gruvbox ~/.icons/
cp -r debian_setup/dotthemes/* ~/.themes/
cp -r debian_setup/dotfonts/* ~/.fonts/
if [ "$window_manager" = "1" ]; then
       cp -r debian_setup/dotconfigs-bspwm/* ~/.config/
       # Make directory so applications like spotify can be opened using rofi
       sudo mkdir /usr/share/desktop-directories/
       sudo cp debian_setup/desktop_icons/* /usr/share/applications/
       cp debian_setup/.xinitrc-bspwm ~/.xinitrc
elif [ "$window_manager" = "2" ]; then
       cp -r debian_setup/dotconfigs-xfwm4/* ~/.config/
       cp debian_setup/.xinitrc-xfwm4 ~/.xinitrc
fi
cp debian_setup/.vimrc ~/.
sudo cp -r debian_setup/terminal_themes/* /usr/share/xfce4/terminal/colorschemes/
yes | sudo cp -f debian_setup/network-interfaces /etc/network/interfaces
sudo mkdir /boot/grub/themes
sudo cp -r debian_setup/grub_themes/* /boot/grub/themes/
sudo cp debian_setup/grub /etc/default/grub
sudo update-grub
sudo os-prober
if [ "$window_manager" = "1" ]; then
       chmod +x ~/.config/bspwm/bspwmrc
       chmod +x ~/.config/polybar/launch.sh
fi

# Install display manager
sudo nala install lightdm -y
sudo systemctl enable lightdm
sudo systemctl set-default graphical.target
