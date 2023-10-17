#!/bin/bash
# Initialize sum to 0
sum=0

# Iterate over each number from 1000 to 2000
for number in {1000..2000}; do
    # Check if the number contains only digits 0 and 1
    if [[ $number =~ ^[01]+$ ]]; then
        # Add the number to the sum
        sum=$((sum + number))
    fi
done

# Print the sum
echo "The sum of numbers between 1000 and 2000 having digits only from the set {0, 1} is: $sum"
