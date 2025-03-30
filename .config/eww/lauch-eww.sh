#!/usr/bin/env -S bash

CONFIG_FILES="$HOME/.config/eww/eww.yuck $HOME/.config/eww/eww.scss"

trap "killall eww" EXIT

while true; do
    eww open-many uptime system player &
    inotifywait -e create,modify $CONFIG_FILES
    killall eww
done
