#!/bin/bash

# Define the directory for the repository
REPO_DIR="jenkins_job"

# Check if the directory exists
if [ -d "$REPO_DIR" ]; then
  echo "Directory $REPO_DIR exists. Pulling the latest changes..."
  # Change to the repository directory
  cd $REPO_DIR
  # Pull the latest changes from the repository
  git pull origin second
else
  echo "Directory $REPO_DIR does not exist. Cloning the repository..."
  # Clone the repository if the directory does not exist
  git clone https://github.com/Sanris7/jenkins_job.git $REPO_DIR
  # Change to the repository directory
  cd $REPO_DIR
fi

# Make sure the script is executable
chmod +x status_report.sh

# Run the script
./status_report.sh
