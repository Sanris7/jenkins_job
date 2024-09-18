#!/bin/bash

# Define the directory where the repo will be saved
TARGET_DIR="/var/jenkins/first"

# Check if the target directory exists, if not, create it
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
fi

# Remove the previous version of the repo if it exists
rm -rf "$TARGET_DIR/jenkins_job"

# Clone the GitHub repo into the target directory
git clone https://github.com/Sanris7/jenkins_job.git "$TARGET_DIR/jenkins_job"

# Change directory to the cloned repo
cd "$TARGET_DIR/jenkins_job" || exit

# Give execute permission to sr_server.sh
chmod +x sr_server.sh

# Run the sr_server.sh script
./sr_server.sh
