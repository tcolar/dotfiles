#!/bin/sh

if [ ! -f ~/.vnc/passwd ]; then 
    echo setup a vnc password
    vncpasswd
fi 
tightvncserver -kill :2
rm /tmp/.X2-lock /tmp/.X11-unix/X2
tightvncserver :2 -geometry 1920x1200 
