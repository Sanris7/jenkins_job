#!/bin/bash

# Simple Status Report Script

# Get the current date and time for the filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define the output file path with timestamp
REPORT_FILE="/var/server/system_status_report_$TIMESTAMP.txt"

# Create the directory if it doesn't exist
mkdir -p /var/lib/jenkins/system_report

# Get the system hostname
HOSTNAME=$(hostname)

# Get the kernel version
KERNEL_VERSION=$(uname -r)

# Get the system uptime
UPTIME=$(uptime -p)

# Get the current disk usage
DISK_USAGE=$(df -h / | grep -v Filesystem | awk '{print $5}')

# Get the current memory usage
MEM_USAGE=$(free -h | grep Mem | awk '{print $3 "/" $2}')

# Get the CPU load
CPU_LOAD=$(top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}')

# Display the system report and save it to the file
{
echo "---------------------------------"
echo "      System Status Report       "
echo "---------------------------------"
echo "Hostname    : $HOSTNAME"
echo "Kernel      : $KERNEL_VERSION"
echo "Uptime      : $UPTIME"
echo "Disk Usage  : $DISK_USAGE"
echo "Memory Usage: $MEM_USAGE"
echo "CPU Load    : $CPU_LOAD"
echo "---------------------------------"
} > $REPORT_FILE

# Optional: Notify that the report has been saved
echo "Status report saved to $REPORT_FILE"
