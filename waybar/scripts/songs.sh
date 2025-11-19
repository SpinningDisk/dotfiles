#!/bin/bash

song_prefix="spotify xesam:title"
full_song=$(playerctl --player=spotify metadata | grep "xesam:title")
if [[ $full_song == "spotify xesam:title"* ]] ;then
    song=${full_song#"$song_prefix"}
    song=$(echo $song | sed -e 's/^[ \t]*//')
    
    artist_prefix="spotify xesam:artist"
    full_artist=$(playerctl metadata | grep "xesam:artist" |  sed -e 's/^[ \w]*//')
    artist=${full_artist#"$artist_prefix"}
    artist=$(echo $artist | sed -e 's/^[ \t]*//') 

    # printf '{"song": "%s", "artist": "%s"}\n' "$song" "$artist"
    echo -e "<span size='10pt'><span color='#6e1a37' weight='Bold'>\"$song\" </span>by <span color='#712396' weight='Bold'>\"$artist\"</span></span>"
else
    echo "/"
fi;
