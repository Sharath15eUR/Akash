#!/bin/bash

# Q1 Recursion
find_files() {
    local dir="$1"
    local keyword="$2"
    for file in "$dir"/*; do
        if [ -d "$file" ]; then
            find_files "$file" "$keyword"
        elif [ -f "$file" ]; then
            grep -i "$keyword" "$file" | while read -r line; do
                echo "$line"
            done
        fi
    done
}

# Q2 Error log
error_logging() {
    echo "$(date) - ERROR: $1" >> errors.log
}

# Q3 Here document and here string
help_display() {
    cat << EOF
Options:
  --help      Show this help message
  -d <dir>    Directory to search recursively
  -f <file>   File to search directly
  -k <key>    Key to search in the file or directory
EOF
}

# Q4 Special parameters
special_params() {
    echo "Script name: $0"
    echo "Number of arguments passed: $1"
    echo "Exit status of last command: $?"
    echo "All arguments passed: $2"
}

# Q5 Regex validation
validate_inputs() {
    [[ -z "$file" || ! -f "$file" ]] && error_logging "'$file' does not exist." && exit 1
    [[ -z "$key" ]] && error_logging "The keyword cannot be empty." && exit 1
    [[ ! "$key" =~ ^[a-zA-Z0-9]+$ ]] && error_logging "$key' is invalid." && exit 1
}


args=("$@")
args_count=$#

# Q6 CLA using getopts
if [[ "$1" == "--help" ]]; then
    help_display
    exit 0
fi

while getopts "d:f:k:" opt; do
    case $opt in
        d) directory=$OPTARG ;;
        f) file=$OPTARG ;;
        k) key=$OPTARG ;;
        *) help_display; exit 1 ;;
    esac
done

if [[ -z "$key" ]]; then
    error_logging "Please specify the keyword."
    help_display
    exit 1
elif [[ -n "$directory" && -n "$file" ]]; then
    error_logging "Select only directory or only file at once."
    help_display
    exit 1
elif [[ -n "$directory" ]]; then
    find_files "$directory" "$key"
elif [[ -n "$file" ]]; then
    validate_inputs
    grep -i "$key" "$file" | while read -r line; do
        echo "$line"
    done
else
    error_logging "Please specify a file or a directory."
    help_display
    exit 1
fi

echo
special_params "$args_count" "${args[*]}"

