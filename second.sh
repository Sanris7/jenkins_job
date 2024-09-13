#!/bin/bash

# Define the output directory and ensure it exists
OUTPUT_DIR="/var/tmp/services/"
mkdir -p "$OUTPUT_DIR"

# Define the output file with date and time
DATE_TIME=$(date +"%Y%m%d_%H%M%S")
OUTPUT_FILE="${OUTPUT_DIR}service_report_${DATE_TIME}.txt"

# List all running services and save to the output file
# For systems using systemd
if command -v systemctl >/dev/null 2>&1; then
    echo "Listing all running services using systemd..." > "$OUTPUT_FILE"
    systemctl list-units --type=service --state=running >> "$OUTPUT_FILE"
# For systems using init.d
elif command -v service >/dev/null 2>&1; then
    echo "Listing all running services using init.d..." > "$OUTPUT_FILE"
    service --status-all 2>&1 | grep '+' >> "$OUTPUT_FILE"
else
    echo "No recognized service management tool found." > "$OUTPUT_FILE"
fi

# Notify user of completion
echo "Service report saved to $OUTPUT_FILE"
