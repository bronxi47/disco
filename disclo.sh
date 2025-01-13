#!/usr/bin/env bash

# https://github.com/bronxi47/disclo

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file.txt> <output.txt>"
    exit 1
fi

input_file="$1"
output_file="$2"

RED='\033[0;31m'
NC='\033[0m'

total_lines=$(grep -E '\.pdf' "$input_file" | wc -l)
current_line=1

grep -Ea '\.pdf' "$input_file" | while read -r i; do 
    echo -ne "Processing line $current_line of $total_lines\r"

    found=$(curl -s "$i" | pdftotext -q - - | egrep -oi 'strictly private|confidential|securing|internal use only|ftp|ssh')
    if [ -n "$found" ]; then
        echo -e "\n$i ${RED}[${found}]${NC}"
        echo "$i [$found]" >> "$output_file"
    fi
    current_line=$((current_line + 1))
done
echo

