#!/usr/bin/env bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar xworkspaces 2>&1 | tee -a /tmp/polybar1.log & disown
polybar xwindow 2>&1 | tee -a /tmp/polybar2.log & disown
polybar right 2>&1 | tee -a /tmp/polybar2.log & disown
