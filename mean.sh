#!/bin/bash


# Function to display usage statement
usage() {
    echo "usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    usage
fi

# Extract the column number
column="$1"

# Determine the input source: from a file or stdin
if [ "$#" -eq 2 ]; then
    file="$2"
else
    file="/dev/stdin"
fi

# Pipeline to compute the mean
cut -d',' -f"$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done
    if [ "$count" -eq 0 ]; then
        echo "No valid data found."
        exit 1
    fi
    average=$(echo "scale=2; $sum / $count" | bc)
    echo $average
}


