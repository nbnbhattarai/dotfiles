#!/usr/bin/env bash

if [[ -z "$(pidof i3lock)" ]]; then
  i3lock -n -i ~/.config/i3/wallpapers/linux.png --tiling &
else
  echo "i3lock is already running"
fi
