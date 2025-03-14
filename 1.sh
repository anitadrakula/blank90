#!/bin/bash

# Navigate to the correct directory in GitHub Codespaces
cd /workspaces/blank90

# Ensure we are in the correct directory for the task
target_dir="."

# Loop to run indefinitely
while true; do
    # Create a random file or directory
    rand_name=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10)
    rand_type=$((RANDOM % 2))

    # Randomly create a file or directory
    if [ $rand_type -eq 0 ]; then
        mkdir "$target_dir/$rand_name"
    else
        touch "$target_dir/$rand_name"
    fi

    # Stage the new file/folder
    git add "$target_dir/$rand_name"

    # Commit the changes
    git commit -m "Random file/folder creation: $rand_name"

    # Push the changes
    git push origin main

    # Wait for 3 minutes (180 seconds)
    sleep 180
done
