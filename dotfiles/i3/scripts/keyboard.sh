#!/bin/bash

# Get the current layout
current_layout=$(setxkbmap -query | awk '/layout/{print $2}')

# Set the new layout
if [ "$current_layout" = "us" ]; then
  setxkbmap de 
else
  setxkbmap us
fi

