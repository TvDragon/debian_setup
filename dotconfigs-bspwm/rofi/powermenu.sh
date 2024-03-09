#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

POSITION=0
YOFF=0
XOFF=0
FONT="FiraCode Nerd Font 12"

# Confirmation
confirm_exit() {
	rofi -dmenu -no-config -i -no-fixed-num-lines -p "Are you sure? : " -font "$FONT"
}

# Define options using an associative array
declare -A options
options=(
    ["lock"]="󰌾 Lock"
    ["reboot"]="󰜉 Restart"
    ["logout"]="󰍃 Logout"
    ["shutdown"]="󰐥 Shutdown"
)

# Construct the options string for rofi
options_string=$(printf "%s\n" "${options[@]}")

# Use rofi to select an option
chosen=$(echo -e "$options_string" | rofi -i -dmenu -p "Uptime: $uptime" -font "$FONT")

# Check the chosen option and execute the corresponding action
case $chosen in
    "${options["shutdown"]}")
        systemctl poweroff
		;;
    "${options["reboot"]}")
        systemctl reboot
        ;;
    "${options["lock"]}")
        # Mute volume
        pactl set-sink-mute @DEFAULT_SINK@ 1
		i3lock
        ;;
    "${options["logout"]}")
        bspc quit
        ;;
esac
