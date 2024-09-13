#!/bin/bash

# Define the directory where the report will be saved
DIRECTORY="/var/tmp/services"
if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
fi

# Get the current date and time for the filename
DATE_TIME=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the filename for the report
FILENAME="$DIRECTORY/services_running_$DATE_TIME.txt"

# List all running services
# You can use `ps` or another method if `systemctl` is not preferred
ps -eo pid,comm,etime --sort=-etime | grep -v '^ *PID' > "$FILENAME"

# Notify the user
echo "Service report saved to $FILENAME"
