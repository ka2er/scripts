#!/bin/sh

KEYMAP=$1

sleep 1
DISPLAY=":0.0"
HOME=/home/seb
AUTHORITY_NAME=`ls /run/gdm/ | grep seb`
XAUTHORITY=/run/gdm/$AUTHORITY_NAME/database
export DISPLAY XAUTHORITY HOME
ID=`xinput list| grep "USB Keyboard" | awk -Fid= '{print $2}' | awk -F\\\t '{print $1}'`
setxkbmap -device $ID $KEYMAP

#echo "setxkbmap -device $ID $KEYMAP" >>  /tmp/$ID
