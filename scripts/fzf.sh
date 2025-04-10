#!/bin/bash

# Exit on error
set -e

echo "Setting up fzf..."

# Update package list if not already updated
if [ -z "$APT_UPDATED" ]; then
    sudo apt-get update
    export APT_UPDATED=1
fi

# Install fzf
if ! command -v fzf &> /dev/null; then
    sudo apt-get install -y fzf
    echo "fzf installed successfully."
else
    echo "fzf is already installed."
fi

# Add alias for fzf in Oh-My-Zsh custom aliases
CUSTOM_ALIASES="$HOME/.oh-my-zsh/custom/aliases.zsh"
if [ ! -f "$CUSTOM_ALIASES" ]; then
    touch "$CUSTOM_ALIASES"
fi

# Add the alias if not already present
if ! grep -q "alias f='fzf'" "$CUSTOM_ALIASES"; then
    echo "alias f='fzf'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'f' for 'fzf'."
else
    echo "Alias 'f' for 'fzf' already exists."
fi

echo "fzf setup complete."
