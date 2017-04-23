#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: excercise.sh <source>.txt"
else
	# Header
	echo "Tudást teszt: $1"
	echo "-------------"
	echo ""
	# Create excercise file as *.tmp
	./create_excercise.sh "$1" > "$1.tmp"
	echo "Tölts ki a tesztet, majd mentéssel lépj ki!"
	read -p "Nyomd meg az entert a kitöltéshez(vim)..."
	# Edit excercise file
	vim "$1.tmp"
	# Calculate and show differences
	read -p "Nyomd meg az entert a kiértékeléshez(vimdiff)..."
	sort "$1" > "$1.sorted"
	sort "$1.tmp" > "$1.tmp.sorted"
	vimdiff "$1.sorted" "$1.tmp.sorted"
	# Cleanup
	rm "$1.tmp"
	rm "$1.sorted"
	rm "$1.tmp.sorted"
fi
