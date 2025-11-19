#!/bin/bash

status=$(hyprctl activewindow -j | grep "title")
status=${status#"    \"title\": \""}
status=${status%"\","}

if [[ $status == *"sudo"* ]]; then
    echo "/home/$(whoami)/.config/waybar/img/KirbySudo.png"
elif [[ $status == *"Ghostty"* ]]; then
    echo "/home/$(whoami)/.config/waybar/img/KirbyGhostty.png"
elif [[ $status == *"Mozilla"* ]]; then
    echo "/home/$(whoami)/.config/waybar/img/KirbyWeb.png"
elif [[ $status == *"Blender"* ]]; then
    echo "/home/$(whoami)/.config/waybar/img/KirbyBlender.png"
else
    echo "/home/$(whoami)/.config/waybar/img/KirbyNeutral.webp"
fi;
