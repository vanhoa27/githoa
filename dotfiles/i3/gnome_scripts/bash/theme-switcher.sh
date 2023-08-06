#!/bin/bash
current_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$current_theme" == "'Yaru-dark'" ]; then
    new_theme="Yaru-light"
elif [ "$current_theme" == "'Yaru-light'"]; then
    new_theme="Yaru-dark"
else
    new_theme="'Yaru-dark'"
    @echo "Your default Theme was set to Yaru-dark"
fi

gsettings set org.gnome.desktop.interface gtk-theme "$new_theme"