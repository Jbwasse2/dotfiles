#!/bin/bash

NUMB=$((1 + RANDOM % 7))
echo $NUMB
case "$NUMB" in
        1) DIR="/home/justin/Pictures/wallpapers-master/Landscapes"
                ;;
        2) DIR="/home/justin/Pictures/wallpapers-master/Vibrant"
                ;;
        3) DIR="/home/justin/Pictures/wallpapers-master/Spacescapes"
                ;;
        4) DIR="/home/justin/Pictures/wallpapers-master/Etc"
                ;;
        5) DIR="/home/justin/Pictures/wallpapers-master/Unsorted"
                ;;
        6) DIR="/home/justin/Pictures/wallpapers-master/Cityscapes"
                ;;
        7) DIR="/home/justin/Pictures/wallpapers-master/Etc"
                ;;
esac
PIC=$(ls $DIR/* | shuf -n1)
PIC_L=$(ls $DIR/* | shuf -n1)
echo $DIR
echo $PIC
#gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
#Set background
feh --bg-fill $PIC
#Set lock screen
