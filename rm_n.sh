#!/bin/bash 

# Function to display usage statement
usage() {
    echo "usage: $0 <dir> <n>" >&2
    exit 1
}

# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

dir="$1"
n="$2"

# Use find to locate and delete files larger than specified size in the provided directory
# Note: +n means "strictly greater than n", and 'c' stands for bytes.
find "$dir" -type f -size +"$n"c -exec rm {} \;

