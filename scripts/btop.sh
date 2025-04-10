#!/bin/bash

# Exit on error
set -e

echo "Setting up btop..."

# Update package list if not already updated
if [ -z "$APT_UPDATED" ]; then
    brew install btop
    export APT_UPDATED=1
fi

# Install btop
if ! command -v btop &> /dev/null; then
    sudo apt-get install -y btop
    echo "btop installed successfully."
else
    echo "btop is already installed."
fi 