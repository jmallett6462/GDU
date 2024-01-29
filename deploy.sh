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

# Rsync to transfer files
rsync -avz --delete -e "ssh -i $SSH_KEY" $local_build_dir/ $remote_user@$remote_host:$remote_dir

# Post-deployment commands
if [ -n "$post_deploy_cmds" ]; then
    ssh -i $ssh_key $remote_user@$remote_host "$post_deploy_cmds"
fi

echo "Deployment completed."
