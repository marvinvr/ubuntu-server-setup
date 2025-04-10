#!/bin/bash

# Exit on error
set -e

echo "Setting up EZA..."

# Install EZA
if ! command -v eza &> /dev/null; then
    brew install eza
    echo "EZA installed successfully."
else
    echo "EZA is already installed."
fi

# Add aliases for eza in Oh-My-Zsh custom aliases
CUSTOM_ALIASES="$HOME/.oh-my-zsh/custom/aliases.zsh"
if [ ! -f "$CUSTOM_ALIASES" ]; then
    touch "$CUSTOM_ALIASES"
fi

# Add the aliases if not already present
if ! grep -q "alias ls='eza --color=always --group-directories-first --icons --long --header'" "$CUSTOM_ALIASES"; then
    echo "alias ls='eza --color=always --group-directories-first --icons --long --header'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'ls' for 'eza'."
else
    echo "Alias 'ls' for 'eza' already exists."
fi

if ! grep -q "alias la='ls --all'" "$CUSTOM_ALIASES"; then
    echo "alias la='ls --all'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'la'."
else
    echo "Alias 'la' already exists."
fi

if ! grep -q "alias l='ls'" "$CUSTOM_ALIASES"; then
    echo "alias l='ls'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'l'."
else
    echo "Alias 'l' already exists."
fi

if ! grep -q "alias lst='ls --level=2 --tree --header'" "$CUSTOM_ALIASES"; then
    echo "alias lst='ls --level=2 --tree --header'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'lst'."
else
    echo "Alias 'lst' already exists."
fi

if ! grep -q "alias lat='lst --all'" "$CUSTOM_ALIASES"; then
    echo "alias lat='lst --all'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'lat'."
else
    echo "Alias 'lat' already exists."
fi

if ! grep -q "alias lt='lst'" "$CUSTOM_ALIASES"; then
    echo "alias lt='lst'" >> "$CUSTOM_ALIASES"
    echo "Added alias 'lt'."
else
    echo "Alias 'lt' already exists."
fi
