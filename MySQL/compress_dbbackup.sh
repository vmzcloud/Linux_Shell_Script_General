#!/bin/bash

# Set the threshold for disk usage
threshold=70

# dbbackup partition
dbbackup_partition=/dbbackup

# compress files
compress_files=/dbbackup/*.sql

# Get the current disk usage percentage for the dbbackup partition
current_usage=$(df $dbbackup_partition | grep / | awk '{print $5}' | sed 's/%//g')

# Check if current disk usage is greater than or equal to the threshold
if [ "$current_usage" -ge "$threshold" ]; then
    # Find files and gzip them
    gzip $compress_files
fi
