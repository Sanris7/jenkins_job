#!/bin/bash

# Create the directory if it doesn't exist
DIRECTORY="/var/tmp/jenkins/services_running"
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
fi

# Get the current date and time for the filename
DATE_TIME=$(date +"%Y-%m-%d_%H-%M-%S")

# Filename for the report
FILENAME="$DIRECTORY/services_running_$DATE_TIME.txt"

# List running services and save to the file
systemctl list-units --type=service --state=running > "$FILENAME"

# Notify the user
echo "Service report saved to $FILENAME"
