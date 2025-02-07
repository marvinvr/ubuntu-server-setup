#!/bin/bash

# Exit on error
set -e

echo "Setting up BAT..."

# Update package list if not already updated
if [ -z "$APT_UPDATED" ]; then
    sudo apt-get update
    export APT_UPDATED=1
fi

# Install BAT
if ! command -v batcat &> /dev/null; then
    sudo apt-get install -y bat
    echo "BAT installed successfully."
else
    echo "BAT is already installed."
fi

# Add alias for bat in Oh-My-Zsh custom aliases
CUSTOM_ALIASES="$HOME/.oh-my-zsh/custom/aliases.zsh"
if [ ! -f "$CUSTOM_ALIASES" ]; then
    touch "$CUSTOM_ALIASES"
fi
if ! grep -q "alias bat='batcat'" "$CUSTOM_ALIASES"; then
    echo "alias bat='batcat'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'bat' for 'batcat' in Oh-My-Zsh custom aliases."
else
    echo "Alias 'bat' for 'batcat' already exists in Oh-My-Zsh custom aliases."
fi