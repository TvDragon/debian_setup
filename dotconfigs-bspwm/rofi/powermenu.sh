#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

POSITION=0
YOFF=0
XOFF=0
FONT="FiraCode Nerd Font 10"

shutdown = " Shutdown"
reboot = "󰜉 Restart"
lock = " Lock"
suspend = "󰤄 Sleep"
logout = "󰍃 Logout"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"
chosen=$(echo -e "$options" | rofi -dmenu -p "Uptime: $uptime" -font "$FONT")
if [ "$chosen" = "$shutdown" ] ; then
	systemctl poweroff
elif [ "$chosen" = "$reboot" ] ; then
	systemctl reboot
elif [ "$chosen" = "$suspend" ] ; then
	# Mute volume
	pactl set-sink-mute @DEFAULT_SINK@ 1
	systemctl suspend
elif [ "$chosen" = "$logout" ] ; then
	bspc quit
fi

# case $chosen in
#     $shutdown)
# 		ans=$(confirm_exit &)
# 		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
# 			systemctl poweroff
# 		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
# 			exit 0
#         else
# 			msg
#         fi
#         ;;
#     $reboot)
# 		ans=$(confirm_exit &)
# 		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
# 			systemctl reboot
# 		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
# 			exit 0
#         else
# 			msg
#         fi
#         ;;
#     $lock)
# 		if [[ -f /usr/bin/i3lock ]]; then
# 			i3lock
# 		elif [[ -f /usr/bin/betterlockscreen ]]; then
# 			betterlockscreen -l
# 		fi
#         ;;
#     $suspend)
# 		ans=$(confirm_exit &)
# 		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
# 			mpc -q pause
# 			amixer set Master mute
# 			systemctl suspend
# 		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
# 			exit 0
#         else
# 			msg
#         fi
#         ;;
#     $logout)
# 		ans=$(confirm_exit &)
# 		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
# 			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
# 				openbox --exit
# 			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
# 				bspc quit
# 			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
# 				i3-msg exit
# 			fi
# 		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
# 			exit 0
#         else
# 			msg
#         fi
#         ;;
# esac
