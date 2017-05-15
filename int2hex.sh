#!/bin/sh

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <int_value>"
        exit 1
fi

echo "obase=16; $1" | bc
