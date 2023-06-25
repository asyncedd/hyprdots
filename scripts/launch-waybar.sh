#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/configs/waybar/config.jsonc $HOME/.config/hypr/configs/waybar/style.css"

trap "killall waybar" EXIT

while true; do
    waybar --config ~/.config/hypr/configs/waybar/config.jsonc --style ~/.config/hypr/configs/waybar/style.css&
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
