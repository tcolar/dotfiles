#!/bin/bash

EXT="HDMI1"
IN="LVDS1"

if (xrandr | grep "$EXT disconnected"); then
	xrandr --output HDMI1 --off --output LVDS1 --mode 1600x900 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --off
else
	xrandr --output HDMI1 --mode 1920x1080 --pos 1600x0 --rotate normal --output LVDS1 --mode 1600x900 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --off
fi
