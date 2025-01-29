#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_directory> <backup_directory> <file_extension>"
    exit 1
fi

source_dir="$1"
backup_dir="$2"
file_ext="$3"

echo "Source Directory: $source_dir"
echo "Backup Directory: $backup_dir"
echo "File Extension: $file_ext"

files=($source_dir/*$file_ext)

if [ ${#files[@]} -eq 0 ]; then
    echo "No files with extension $file_ext found in $source_dir."
    exit 1
fi

echo "Files to back up:"
for file in "${files[@]}"; do
    echo "$file"
done
export backup_count=0

echo "File sizes before backup:"
for file in "${files[@]}"; do
    file_size=$(stat -c %s "$file")  # Get the size of each file
    echo "$file - $file_size bytes"
    export backup_count=$((backup_count + 1))
done
echo "Backup count: $backup_count"
