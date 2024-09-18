#!/bin/bash

# Define variables
REPO_URL="https://github.com/Sanris7/jenkins_job.git"
TARGET_DIR="/var/jenkins/second"
SCRIPT_NAME="second.sh"

# Remove the old directory if it exists
if [ -d "$TARGET_DIR" ]; then
    echo "Removing existing directory $TARGET_DIR..."
    rm -rf "$TARGET_DIR"
fi

# Clone the repository
echo "Cloning the repository..."
git clone "$REPO_URL" "$TARGET_DIR"

# Check if cloning was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone the repository."
    exit 1
fi

# Set execute permission for second.sh
if [ -f "$TARGET_DIR/$SCRIPT_NAME" ]; then
    echo "Setting execute permissions for $SCRIPT_NAME..."
    chmod +x "$TARGET_DIR/$SCRIPT_NAME"
else
    echo "Script $SCRIPT_NAME not found."
    exit 1
fi

# Run the second.sh script
echo "Running $SCRIPT_NAME..."
"$TARGET_DIR/$SCRIPT_NAME"

# Check if script ran successfully
if [ $? -ne 0 ]; then
    echo "$SCRIPT_NAME execution failed."
    exit 1
fi

echo "Script executed successfully."
