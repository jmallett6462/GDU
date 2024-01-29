#!/bin/bash

# Configuration file name
CONFIG_FILE="gdu.config"

# Check if the configuration file already exists
if [ -f "$CONFIG_FILE" ]; then
    echo "Configuration file already exists in the current directory."
    exit 1
fi

# Gathering configuration information
read -p "Enter remote server username: " remote_user
read -p "Enter remote server host/IP: " remote_host
read -p "Enter remote directory for deployment: " remote_dir
read -p "Enter local directory of your project build: " local_build_dir
read -p "Enter path to your SSH private key: " ssh_key
read -p "Enter post-deployment commands (optional): " post_deploy_cmds

# Writing configuration to the file
echo "remote_user=$remote_user" > "$CONFIG_FILE"
echo "remote_host=$remote_host" >> "$CONFIG_FILE"
echo "remote_dir=$remote_dir" >> "$CONFIG_FILE"
echo "local_build_dir=$local_build_dir" >> "$CONFIG_FILE"
echo "ssh_key=$ssh_key" >> "$CONFIG_FILE"
echo "post_deploy_cmds=$post_deploy_cmds" >> "$CONFIG_FILE"

echo "Configuration file created: $CONFIG_FILE"
