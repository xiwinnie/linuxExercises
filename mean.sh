#!/bin/bash

# Display the usage statement if no arguments are provided
if [ "$#" -lt 1 ]; then
    echo "usage: $0 <column> [file.csv]" >&2
    exit 1
fi

# Get the column number and the input file (or stdin)
column="$1"
file="${2:-/dev/stdin}"

# Use cut to select the required column, tail to skip the header, and a while read loop to calculate the mean
cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0

    while read -r value; do
        sum=$((sum + value))
        count=$((count + 1))
    done

    # Calculate and echo the mean
    if [ "$count" -gt 0 ]; then
        mean=$(bc <<< "scale=2; $sum / $count")
        echo "Mean: $mean"
    else
        echo "No data found" >&2
    }
