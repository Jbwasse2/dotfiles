#!/bin/bash
CURR=$(gsettings get org.gnome.desktop.background picture-uri)
CURR=${CURR:8}
CURR=${CURR::-1}
rm $CURR
echo "$CURR"
./shuffle.sh
