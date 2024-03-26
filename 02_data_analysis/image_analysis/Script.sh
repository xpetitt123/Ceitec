#!/bin/bash

# Set the directory where your folders with images are located
base_dir="/home/tomasp/Documents/Potential projects/Ceitec FDA/bad or non-curves"

# Create a directory to store the copied and renamed images
mkdir -p "$base_dir/Images"

# Initialize a counter for renaming images
counter=1
errors=0

# Create a file to log errors
error_log="$base_dir/error_log.txt"
touch "$error_log"

# Loop through each folder in the base directory
for folder in "$base_dir"/*; do
    # Check if the item is a directory
    if [ -d "$folder" ]; then
        # Loop through each subfolder in the current folder
        for subfolder in "$folder"/*; do
            # Check if the item is a directory
            if [ -d "$subfolder" ]; then
                # Copy and rename each image in the subfolder
                for image in "$subfolder"/*.png; do
                    if cp "$image" "$base_dir/Images/$counter.png"; then
                        echo "Copied: $image to $base_dir/Images/$counter.png"
                        ((counter++))
                    else
                        echo "Error: Failed to copy $image"
                        echo "Error: Failed to copy $image" >> "$error_log"
                        ((errors++))
                    fi
                done
            fi
        done
    fi
done

echo "Total number of images copied and renamed: $((counter - 1))"
echo "Total number of errors encountered: $errors"
