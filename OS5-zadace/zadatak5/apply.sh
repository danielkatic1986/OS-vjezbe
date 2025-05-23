#!/bin/bash

# Provjera argumenata
if [ "$#" -ne 2 ]; then
	echo "Greška, morate proslijediti točno 2 argumenta."
	echo "Primjer: ./apply.sh rwxr-xr-- /putanja/datoteka"
	exit 1
fi

DOZVOLE="$1"
DATOTEKA="$2"

# Provjera duljine stringa
if [ "${#DOZVOLE}" -ne 9 ]; then
	echo "Greška, prvi argument mora imati točno 9 znakova, npr. rwxr-xr--"
	exit 1
fi

# Funkcija za pretvaranje tri karaktera u broj
pretvorba_u_broj() {
	local tri_ch=$1
	local broj=0

	[[ ${tri_ch:0:1} == "r" ]] && broj=$((broj + 4))
	[[ ${tri_ch:1:1} == "w" ]] && broj=$((broj + 2))
	[[ ${tri_ch:2:1} == "x" ]] && broj=$((broj + 1))

	echo -n "$broj"
}

# Razdvajanje stringa u 3 grupe po 3 znaka
KORISNIK=${DOZVOLE:0:3}
GRUPA=${DOZVOLE:3:3}
DRUGI=${DOZVOLE:6:3}

# Pretvorba u oktalnu vrijednost
OCT="$(pretvorba_u_broj "$KORISNIK")$(pretvorba_u_broj "$GRUPA")$(pretvorba_u_broj "$DRUGI")"

# Promjena dozvola
chmod "$OCT" "$DATOTEKA"

echo "Dozvole $DOZVOLE -> $OCT su postavljene za datoteku $DATOTEKA"
