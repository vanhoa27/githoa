#!/bin/bash

# Take a screenshot using maim and save it to ~/Pictures/Screenshot/
filename=$(date +%Y-%m-%d_%H-%M-%S).png
maim -u ~/Pictures/Screenshots/"$filename"

# Copy the screenshot to the clipboard using xclip
xclip -selection clipboard -t image/png -i /home/vanhoa/Pictures/Screenshots/"$filename"

# Notify the user that the screenshot has been taken and copied to the clipboard
notify-send "Screenshot taken and copied to clipboard: /home/vanhoa/Pictures/Screenshots/$filename"

