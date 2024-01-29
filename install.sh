#!/bin/bash

# Define variables
GDU_DIR="$HOME/.gdu"
REPO_URL="https://raw.githubusercontent.com/jmallett6462/GDU/main"

# Create the .gdu directory
mkdir -p "$GDU_DIR"
echo "GDU directory created at $GDU_DIR"

# Download other GDU scripts
echo "Downloading GDU scripts..."
curl -fsSL "$REPO_URL/gdu.sh" -o "$GDU_DIR/gdu"
curl -fsSL "$REPO_URL/configure.sh" -o "$GDU_DIR/configure.sh"
curl -fsSL "$REPO_URL/deploy.sh" -o "$GDU_DIR/deploy.sh"

# Give execute permissions
chmod +x "$GDU_DIR/gdu"
chmod +x "$GDU_DIR/configure.sh"
chmod +x "$GDU_DIR/deploy.sh"

# Determine which shell is being used and update the corresponding rc file
SHELL_RC=""

if [ -n "$ZSH_VERSION" ]; then
    # User is using Zsh
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    # User is using Bash
    SHELL_RC="$HOME/.bashrc"
else
    # Default to .bashrc if unable to determine shell
    SHELL_RC="$HOME/.bashrc"
    echo "Unable to determine shell type. Defaulting to Bash."
fi

# Add .gdu to PATH
if ! grep -q "$GDU_DIR" <<< "$(cat $SHELL_RC)"; then
    echo "export PATH=\$PATH:$GDU_DIR" >> "$SHELL_RC"
    echo ".gdu directory added to PATH in $SHELL_RC. Please restart your terminal or source your rc file."
else
    echo "GDU directory already in PATH in $SHELL_RC"
fi
