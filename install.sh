#!/bin/bash

# Define variables
GDU_DIR="$HOME/.gdu"
REPO_URL="https://raw.githubusercontent.com/username/GDU/main"

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

# Add .gdu to PATH
echo "export PATH=\$PATH:$GDU_DIR" >> "$HOME/.bashrc"
echo ".gdu directory added to PATH. Please restart your terminal or source .bashrc"
