#!/bin/bash

if [ "$#" -eq 1 ]; then
    if [ -d "$1" ]; then
        cd "$1"
        zip -r "svi_zapisi.zip" *
    else
        echo "Direktorij $1 ne postoji!"
        exit 1
    fi
else
    echo "Morate proslijediti jedan argument!"
    exit 1
fi