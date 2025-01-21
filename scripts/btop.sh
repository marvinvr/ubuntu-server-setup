#!/bin/bash

# Exit on error
set -e

echo "Setting up btop..."

# Update package list
sudo apt-get update

# Install btop
if ! command -v btop &> /dev/null; then
    sudo apt-get install -y btop
    echo "btop installed successfully."
else
    echo "btop is already installed."
fi 