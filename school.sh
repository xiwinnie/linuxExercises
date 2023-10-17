#!/bin/bash

# Download the data
wget http://pages.stat.wisc.edu/~jgillett/DSCP/linux/Property_Tax_Roll.csv

# Define the pipeline
cat Property_Tax_Roll.csv |  # Step 1: Display the entire file
    grep "MADISON SCHOOLS" |  # Step 2: Select lines containing "MADISON SCHOOLS"
    cut -d ',' -f 7 |  # Step 3: Select the 7th column (TotalAssessedValue)
    awk '{ sum += $1; count++ } END { print "Sum:", sum, "Average:", sum/count }'  # Step 4: Calculate sum and average

# Remove the downloaded file if needed
# rm Property_Tax_Roll.csv
