#!/bin/bash

# Exit on error
set -e

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Run apt-get update once at the beginning and set environment variable
echo "Updating package lists..."
sudo apt-get update
export APT_UPDATED=1

# Download scripts
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/zsh.sh -o "$TEMP_DIR/zsh.sh"
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/batcat.sh -o "$TEMP_DIR/batcat.sh"
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/eza.sh -o "$TEMP_DIR/eza.sh"
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/btop.sh -o "$TEMP_DIR/btop.sh"
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/tailscale.sh -o "$TEMP_DIR/tailscale.sh"

# Make scripts executable
chmod +x "$TEMP_DIR/zsh.sh"
chmod +x "$TEMP_DIR/batcat.sh"
chmod +x "$TEMP_DIR/eza.sh"
chmod +x "$TEMP_DIR/tailscale.sh"
chmod +x "$TEMP_DIR/btop.sh"

# Run scripts
"$TEMP_DIR/zsh.sh"
"$TEMP_DIR/batcat.sh"
"$TEMP_DIR/eza.sh"
"$TEMP_DIR/tailscale.sh"
"$TEMP_DIR/btop.sh"

echo "Setup complete!"