#!/bin/sh

#/usr/bin/lxpolkit &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
dbus-run-session bspwm

VIRSH_STATUS=$(sudo virsh net-list --all | awk '{print $2}' | tail -2 | head -n 2)
if [ "$VIRST_STATUS" = "inactive" ]; then
	sudo virsh net-start default
fi
