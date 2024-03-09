#!/usr/bin/env bash

# nm-applet
killall -q nm-applet
# while pgrep -u $UID -x nm-applet >/dev/null; do sleep 1; done
# nm-applet 2>&1 | tee -a /tmp/nm-applet1.log & disown

# Polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar top 2>&1 | tee -a /tmp/polybar1.log & disown
