#!/bin/bash

# Exit on error
set -e

echo "Setting up Homebrew..."

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    # Execute the official Homebrew installation script
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully."
else
    echo "Homebrew is already installed."
fi

echo "Homebrew setup complete."
