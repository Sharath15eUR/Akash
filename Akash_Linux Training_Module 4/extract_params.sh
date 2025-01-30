#!/bin/bash

INPUT="$HOME/Downloads/input.txt"
OUTPUT="$HOME/Downloads/output.txt"

if [[ ! -f "$INPUT" ]]; then
    echo "Final is not in the system. Please Check!"
    exit 1
fi

> "$OUTPUT"

while IFS=": " read -r key value; do
    if [[ $key == "\"frame.time\"" || $key == "\"wlan.fc.type\"" || $key == "\"wlan.fc.subtype\"" ]]; then
        value=${value//\"/}
        echo "${key//\"}: ${value}" >> "$OUTPUT"
    fi
done < "$INPUT"

echo "Extracted successfully at $OUTPUT"
