#!/bin/bash

putanja="./screenshots"
brojac=1
datoteke=()

cd "$putanja"

for datoteka in *; do
    novo_ime="screenshot_${brojac}_$datoteka"
    echo "$novo_ime"
    ((brojac++))
    mv "$datoteka" "$novo_ime"
done