#!/bin/bash

# Define the directory where you want to store your daily logs
LOG_DIR="$HOME/logs"

# Create the log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Get the current date in YYYY-MM-DD format
DATE=$(date +%Y-%m-%d)

# Define the log file path
LOG_FILE="$LOG_DIR/$DATE.txt"

# Check if the log file already exists
if [ -e "$LOG_FILE" ]; then
    echo "Log file for today already exists. Opening..."
    open -t "$LOG_FILE"
else
    # Create a new log file for today and open it for editing
    touch "$LOG_FILE"
    echo "Log file for $DATE created. Please enter your daily log. Press Ctrl+D when done."
    cat >> "$LOG_FILE"
fi

# Add, commit, and push the log file to your remote repository
git add "$LOG_FILE"
git commit -m "Log update for $DATE"
git push origin main

echo "Log successfully committed and pushed to the remote repository."
