#!/bin/bash


status=$(hyprctl activewindow -j | grep "title")
status=${status#"    \"title\": \""}
status=${status%"\","}

if [[ $status == *"sudo"* ]]; then
    ffplay -v 0 -nodisp -autoexit "/home/$(whoami)/.config/waybar/sounds/DDD/sound$(shuf -i 1-1 -n 1).mp3" &
elif [[ $status == *"Ghostty"* ]]; then
    ffplay -v 0 -nodisp -autoexit "/home/$(whoami)/.config/waybar/sounds/Kirby/poyo$(shuf -i 1-10 -n 1).mp3" &
elif [[ $status == *"Mozilla"* ]]; then
    ffplay -v 0 -nodisp -autoexit "/home/$(whoami)/.config/waybar/sounds/Taranza/Taranza.ogx" -af "volume=0.1" &   
else
    ffplay -v 0 -nodisp -autoexit "/home/$(whoami)/.config/waybar/sounds/Kirby/poyo$(shuf -i 1-10 -n 1).mp3" &
fi;
