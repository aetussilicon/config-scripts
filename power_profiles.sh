#!/bin/bash

case "$1" in
    --toggle)
        current=$(powerprofilesctl get)
        if [ "$current" = "performance" ]; then
            powerprofilesctl set balanced
        elif [ "$current" = "balanced" ]; then
            powerprofilesctl set power-saver
        else
            powerprofilesctl set performance
        fi
        ;;
    *)
        current=$(powerprofilesctl get)
        echo "Profile: $current"
        ;;
esac

