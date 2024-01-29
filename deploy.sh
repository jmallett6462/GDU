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

# Rsync to transfer files (including SSH port)
rsync -avz --delete -e "ssh -i $ssh_key -p $remote_port" $local_build_dir/ $remote_user@$remote_host:$remote_dir

# Post-deployment commands (including SSH port)
if [ -n "$post_deploy_cmds" ]; then
    ssh -i $ssh_key -p $remote_port $remote_user@$remote_host "$post_deploy_cmds"
fi

echo "Deployment completed."
