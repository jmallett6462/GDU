#!/bin/bash

# Configuration file name
CONFIG_FILE="gdu.config"

# Check if the configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found in the current directory."
    exit 1
fi

# Load configuration
source "$CONFIG_FILE"

# Deploying the project
echo "Deploying project..."

# Build the project (if needed)
# Add project-specific build commands here if necessary

# Rsync to transfer files (add SSH key if password-less login is not set up)
rsync -avz --delete $local_build_dir/ $remote_user@$remote_host:$remote_dir

# Post-deployment commands
if [ -n "$post_deploy_cmds" ]; then
    ssh $remote_user@$remote_host "$post_deploy_cmds"
fi

echo "Deployment completed."
