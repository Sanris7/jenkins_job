#!/bin/bash

# Simple Status Report Script

# Get the system uptime
UPTIME=$(uptime -p)

# Get the current disk usage
DISK_USAGE=$(df -h / | grep -v Filesystem | awk '{print $5}')

# Get the current memory usage
MEM_USAGE=$(free -h | grep Mem | awk '{print $3 "/" $2}')

# Get the CPU load
CPU_LOAD=$(top -bn1 | grep load | awk '{printf "%.2f", $(NF-2)}')

# Define the output file path
REPORT_FILE="/var/lib/jenkins/system_report/system_status_report.txt"

# Display the system report and save it to a file in /root/
{
echo "---------------------------------"
echo "      System Status Report       "
echo "---------------------------------"
echo "Uptime      : $UPTIME"
echo "Disk Usage  : $DISK_USAGE"
echo "Memory Usage: $MEM_USAGE"
echo "CPU Load    : $CPU_LOAD"
echo "---------------------------------"
} > $REPORT_FILE

# Optional: Notify that the report has been saved
echo "Status report saved to $REPORT_FILE"

# Send the report to Checkmk (Optional, replace with actual server details)
#curl -X POST -d "uptime=$UPTIME&disk_usage=$DISK_USAGE&memory_usage=$MEM_USAGE&cpu_load=$CPU_LOAD" http://<Checkmk-Server-IP>/submit-data
