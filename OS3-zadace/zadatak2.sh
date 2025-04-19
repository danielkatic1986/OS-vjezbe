#!/bin/bash

if [ "$#" -eq 1 ]; then
    if [ "$1" -ge 1 ] && [ "$1" -le 10 ]; then
        touch brojevi.txt
        for (( i=1; i <= $1; i++ )); do
            echo "$i" >> brojevi.txt
        done
    else
        echo "Argument nije u rasponu!"
        exit 1
    fi
else
    echo "Morate proslijediti jedan argument, broj između 1 i 10!"
    exit 1
fi