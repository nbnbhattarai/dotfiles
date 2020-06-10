#!/usr/bin/env bash

echo ""
echo "=============================="
echo -e "$(date) : Starting applications.\n"

declare -a programs_startup=(
    "dunst"
    "sxhkd"
    "picom"
    "parcellite"
    "pa-applet"
    "nm-applet"
    "blueman-applet"
)

declare -a lazy_load=(
    "firefox"
    "workrave"
    "goldendict"
    "ibus-daemon -drx"
)

# set wallpaper
feh --bg-scale ~/Pictures/Wallpapers/space.jpg

if [[ $(xrandr | grep "^DP1" | grep connected) ]]; then
    xrandr --output DP1 --mode 1360x768 --rate 60 --right-of "eDP1" --brightness 0.4
fi

# urxvt daemon
# pkill urxvtd
# pgrep urxvtd || urxvtd --quiet --opendisplay --fork

for program in "${programs_startup[@]}"; do
    if pgrep $program; then
        :
    else
        echo ""
        echo "Starting application $program"
        $program &
    fi
done

# Restore cursor theme
xsetroot -xcf /usr/share/icons/Breeze_Obsidian/cursors/left_ptr 10 &

# Load Xresources
xrdb "${HOME}/.Xresources" &

# blueman applet
# blueman-applet &


sleep 10
for program in "${lazy_load[@]}"; do
    if pgrep $program; then
        return 0
    else
        $program &
    fi
done

