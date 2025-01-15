#!/bin/bash

# Exit on error
set -e

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Download scripts
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/zsh.sh -o "$TEMP_DIR/zsh.sh"
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/tailscale.sh -o "$TEMP_DIR/tailscale.sh"

# Make scripts executable
chmod +x "$TEMP_DIR/zsh.sh"
chmod +x "$TEMP_DIR/tailscale.sh"

# Run scripts
"$TEMP_DIR/zsh.sh"
"$TEMP_DIR/tailscale.sh"

echo "Setup complete!"