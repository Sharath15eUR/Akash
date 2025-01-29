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

if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
    if [ $? -ne 0 ]; then
        echo "Failed to create backup directory: $backup_dir"
        exit 1
    fi
fi

echo "Files to back up:"
for file in "${files[@]}"; do
    echo "$file"
done

total_size=0
for file in "${files[@]}"; do
    dest_file="$backup_dir/$(basename "$file")"
    file_size=$(stat -c %s "$file")
    total_size=$((total_size + file_size))
    if [ -e "$dest_file" ]; then
        if [ "$file" -nt "$dest_file" ]; then
            cp "$file" "$dest_file"
        fi
    else
        cp "$file" "$dest_file"
    fi
done

backup_count=${#files[@]}
report_path="$backup_dir/backup_report.log"

echo "Backup completed successfully."
echo "Generating backup report at $report_path..."
echo "Backup Report" > "$report_path"
echo "===================" >> "$report_path"
echo "Source Directory: $source_dir" >> "$report_path"
echo "Backup Directory: $backup_dir" >> "$report_path"
echo "File Extension: $file_ext" >> "$report_path"
echo "Total Files Processed: $backup_count" >> "$report_path"
echo "Total Size of Files: $total_size bytes" >> "$report_path"
echo "Backup Directory Path: $backup_dir" >> "$report_path"

echo "Report generated: $report_path"
