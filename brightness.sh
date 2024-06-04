#!/bin/bash

if [ "$1" == "up" ]; then
    brightnessctl set +10%
elif [ "$1" == "down" ]; then
    brightnessctl set 10%-
else
    echo "Usage: $0 {up|down}"
    exit 1
fi

