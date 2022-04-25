#!/bin/bash
killall dunst

echo "== Sending notifications with Dunstify..."
dunstify --urgency=normal   "Dunst Test" "A thing is happening"
dunstify --urgency=low      "Dunst Test" "The thing that is happening does not seem to be of significant importance"
dunstify --urgency=critical "Dunst Test" "Oh noes! This actually is an important thing!"

echo "== Sleeping 5 seconds..."
sleep 5

echo "== Sending system notifications with notify-send..."
notify-send --urgency=normal   "Notify Test" "Another thing is happening"
notify-send --urgency=critical "Notify Test" "OK, I got it!"
notify-send --urgency=low      "Notify Test" "Definitely not important"
