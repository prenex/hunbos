#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: create_excercise.sh <source>.txt"
else
	sort -R "$1" | sed 's/|.*$//' | sed '/^\s*$/d'
fi
