#!/bin/bash

# Exit on error
set -e

echo "Setting up Tailscale..."

# Install Tailscale
if ! command -v tailscale &> /dev/null; then
    curl -fsSL https://tailscale.com/install.sh | sh
fi

echo "Tailscale installed. Running tailscale up..."
sudo tailscale up --accept-dns