#!/bin/bash

# Exit on error
set -e

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Download scripts
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/zsh_setup.sh -o "$TEMP_DIR/zsh_setup.sh"
curl -fsSL https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/tailscale_setup.sh -o "$TEMP_DIR/tailscale_setup.sh"

# Make scripts executable
chmod +x "$TEMP_DIR/zsh_setup.sh"
chmod +x "$TEMP_DIR/tailscale_setup.sh"

# Run scripts
"$TEMP_DIR/zsh_setup.sh"
"$TEMP_DIR/tailscale_setup.sh"

echo "Setup complete!"