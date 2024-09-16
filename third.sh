#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p /var/third

# Define the timestamp format
timestamp=$(date +"%Y%m%d_%H%M%S")

# Define the output file with timestamp
output_file="/var/third/system_info_$timestamp.txt"

# Gather system information
{
    echo "System Information Report - $timestamp"
    echo "-------------------------------------"
    echo
    echo "Hostname: $(hostname)"
    echo "Kernel Version: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo
    echo "CPU Information:"
    lscpu
    echo
    echo "Memory Usage:"
    free -h
    echo
    echo "Disk Usage:"
    df -h
    echo
    echo "Disk Partition Info:"
    lsblk
    echo
    echo "Network Configuration:"
    ip a
    echo
    echo "Logged-in Users:"
    who
} > "$output_file"

# Notify user of completion
echo "System information saved to $output_file"
