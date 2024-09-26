#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path> <extension>"
    exit 1
fi

path="$1"
extension="$2"

if [ ! -d "$path" ]; then
    echo "Error: directory not found"
    exit 1
fi

cd "$path" || exit 1

find . -type f -name "*.$extension" -exec echo "{}" \;



