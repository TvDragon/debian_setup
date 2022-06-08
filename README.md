<h1 align="center">Polar Space<h1>

Polar Space is a minimialistic Linux setup for Debian using the Nord Polar Night Theme. This setup uses BSPWM as the tilting window manager.

## Depedencies
- bspwm
- sxhkd
- polybar
- picom
- rofi
- xfce4-terminal
- vim

## Installation Steps (Debian Server netinst.iso)
**NOTE:** This guide uses ``~/`` as the default path for cloning repos

1. First you will need to use the debian server netinst iso image which can be installed from:

	[![](https://www.debian.org/Pics/openlogo-50.png)](https://www.debian.org/distrib/netinst)
2. Flash debian server netinst onto a usb and install the system onto your drive.
3. Update your repositories:

		sudo apt update
4. Upgrade your system:

		sudo apt upgrade
5. Optional Changes

	Before running the script you may wish to use a different terminal emulator. If so, then open up ``setup.sh`` script and change xfce4-terminal to your desired terminal emulator. Afterwards open up ``dotconfigs/sxhkd/sxhkdrc`` and change and change the command ``xfce4-terminal`` to the command for your desired terminal emulator
6. Run the ``setup.sh`` script:

		sh setup.sh

