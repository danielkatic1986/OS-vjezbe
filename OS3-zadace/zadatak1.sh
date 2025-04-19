#!/bin/bash

if [ "$#" == 2 ]; then
    PUTANJA=$1
    NASTAVAK=$2
    datoteke=()
    
    for datoteka in $PUTANJA/*$NASTAVAK; do
        if [ -e "$datoteka" ] && [ -f "$datoteka" ]; then
            echo "$(basename $datoteka)"
            datoteke+=$datoteka
        fi
    done

    if [ "${#datoteke[@]}" -eq 0 ]; then 
        echo "Nema $NASTAVAK datoteka u $PUTANJA direktoriju"
    fi

else
    echo "Morate proslijediti dva argumenta!"
    exit 1
fi