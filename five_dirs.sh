 #!/bin/bash 
mkdir five
# Use a loop to create the subdirectories dir1 to dir5
for dir in {1..5}; do
    mkdir "five/dir$dir"
done

for dir in {1..5}; do
    # Within each subdirectory, create files from file1 to file4
    for file_num in {1..4}; do
        # Use a loop to generate the content for each file
        for line in $(seq $file_num); do
            # Write the number into the file
            echo $file_num >> "five/dir$dir/file$file_num"
        done
    done
done





   
