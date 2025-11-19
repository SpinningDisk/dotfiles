#!/bin/bash

case $1 in
    "default")
        rm ~/.config/waybar/style.css ~/.config/waybar/config.jsonc
        ln -s ~/.config/waybar/lib/Default/style.css ~/.config/waybar/style.css
        ln -s ~/.config/waybar/lib/Default/config.jsonc ~/.config/waybar/config.jsonc
        if [ $(ps aux | grep "waybar" | wc -l) -ge 4 ];then
            killall waybar
        fi;
        waybar --log-level off &
        ;;
    "old")
        rm ~/.config/waybar/style.css ~/.config/waybar/config.jsonc
        ln -s ~/.config/waybar/lib/Old/style.css ~/.config/waybar/style.css
        ln -s ~/.config/waybar/lib/Old/config.jsonc ~/.config/waybar/config.jsonc
        if [ $(ps aux | grep "waybar" | wc -l) -ge 4 ];then
            killall waybar
        fi;
        waybar --log-level off &
        ;;
    "kirby")
        rm ~/.config/waybar/style.css ~/.config/waybar/config.jsonc
        ln -s ~/.config/waybar/lib/Kirby/style.css ~/.config/waybar/style.css
        ln -s ~/.config/waybar/lib/Kirby/config.jsonc ~/.config/waybar/config.jsonc
        if [ $(ps aux | grep "waybar" | wc -l) -ge 4 ];then
            killall waybar
        fi;
        waybar --log-level off &
        ;;

    "none")
        killall waybar
esac;
