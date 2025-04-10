#!/bin/bash

# Exit on error
set -e

echo "Setting up fzf..."

# Install fzf
if ! command -v fzf &> /dev/null; then
    brew install fzf
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
