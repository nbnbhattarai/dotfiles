if [[ $(xrandr | grep "^DP1" | grep ' connected') ]]; then
    xrandr --output DP1 --off;
    xrandr --output DP1 --mode 1360x768 --right-of eDP1;
fi
