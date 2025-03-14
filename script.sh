#!/bin/bash

# Navigate to the repo root directory
cd "$(dirname "$0")/workspaces/blank90/

# Infinite loop to create a random file/folder and push changes every 3 minutes
while true; do
    # Create a random number for file/folder name
    RANDOM_NAME=$(cat /proc/sys/kernel/random/uuid)
    RANDOM_PATH="${PWD}/${RANDOM_NAME}"

    # Randomly decide if we are creating a file or a folder
    if (( RANDOM % 2 )); then
        # Create a random folder
        mkdir -p "$RANDOM_PATH"
    else
        # Create a random file
        echo "Random file created at $RANDOM_PATH" > "$RANDOM_PATH"
    fi

    # Add and commit the new file/folder to git
    git add "$RANDOM_PATH"
    git commit -m "Add random file/folder: $RANDOM_NAME"

    # Push the changes to the remote repository
    git push origin main

    # Wait for 3 minutes (180 seconds)
    sleep 180
done
