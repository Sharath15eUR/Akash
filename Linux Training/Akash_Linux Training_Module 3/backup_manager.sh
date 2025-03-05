#!/bin/bash

#Q1 Command-line Arguments and Quoting
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

#Q2 Globbing to find files with the specified extension
files=($source_dir/*$file_ext)
if [ ${#files[@]} -eq 0 ]; then
    echo "No files with extension $file_ext found in $source_dir."
    exit 1
fi

#Q3 Export Statements
export BACKUP_COUNT=0

echo "Files to back up:"
for file in "${files[@]}"; do
    echo "$file"
    export BACKUP_COUNT=$((BACKUP_COUNT + 1))
done

#Q4 Array Operations
echo "File sizes before backup:"
for file in "${files[@]}"; do
    file_size=$(stat -c %s "$file")
    echo "$file - $file_size bytes"
done
echo "Backup count: $BACKUP_COUNT"

#Q5 Conditional Execution
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
    if [ $? -ne 0 ]; then
        echo "Failed to create backup directory: $backup_dir"
        exit 1
    fi
    echo "Backup directory created: $backup_dir"
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
echo "Backup count: $backup_count"

#Q6 Output Report
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

if [ -f "$report_path" ]; then
    echo "Report generated: $report_path"
else
    echo "Failed to generate report at $report_path"
fi
