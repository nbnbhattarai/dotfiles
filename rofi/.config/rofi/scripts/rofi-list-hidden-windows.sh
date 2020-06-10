#!/bin/bash
nodes=( $(bspc query -N -n .hidden) ) && s=$(xtitle ${nodes[@]} | rofi -dmenu -format i)
[[ -n "$s" ]] && bspc node "${nodes[$s]}" -n focused -g hidden=off -f
