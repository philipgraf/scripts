#!/bin/bash

set -e

selected_device=$(adb devices -l | grep model | selecta)

serial=$(echo "$selected_device" | cut -f1 -d" ")

if [[ -z "$serial" ]]; then
        echo "No device selected"
        exit 1
fi

echo "Using device $serial"

package=$(adb -s "$serial" shell cmd package list packages -f | selecta -s package:)

if [[ -z "$package" ]]; then
        echo "No App selected"
        exit 1
fi

path=$(echo "$package" | cut -f2 -d":" | cut -f1 -d"=")

default_destination=$(basename "$path")

read -rp "Enter destination($default_destination):" destination
destination=${destination:-$default_destination}

adb -s "$serial" pull "$path" "$destination"
