#!/bin/bash

# Function definitions for each command
configure() {
    bash configure.sh
}

deploy() {
    bash deploy.sh
}

# Main script execution
case "$1" in
    config)
        configure
        ;;
    deploy)
        deploy
        ;;
    *)
        echo "Usage: gdu {config|deploy}"
        exit 1
        ;;
esac
