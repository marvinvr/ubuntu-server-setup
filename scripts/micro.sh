#!/bin/bash

# Exit on error
set -e

echo "Setting up micro editor..."

# Update package list if not already updated
if [ -z "$APT_UPDATED" ]; then
    sudo apt-get update
    export APT_UPDATED=1
fi

# Install micro
if ! command -v micro &> /dev/null; then
    sudo apt-get install -y micro
    echo "micro installed successfully."
else
    echo "micro is already installed."
fi

# Add aliases for micro in Oh-My-Zsh custom aliases
CUSTOM_ALIASES="$HOME/.oh-my-zsh/custom/aliases.zsh"
if [ ! -f "$CUSTOM_ALIASES" ]; then
    touch "$CUSTOM_ALIASES"
fi

# Add the 'm' alias if not already present
if ! grep -q "alias m=\"micro\"" "$CUSTOM_ALIASES"; then
    echo "alias m=\"micro\"" >> "$CUSTOM_ALIASES"
    echo "Added alias 'm' for 'micro'."
else
    echo "Alias 'm' for 'micro' already exists."
fi

# Add the 'mm' alias if not already present
# Note the use of single quotes to preserve the double quotes inside the alias definition
# This alias requires 'fasd' to be installed and initialized separately
if ! grep -q 'alias mm="fasd -e micro --f"' "$CUSTOM_ALIASES"; then
    echo 'alias mm="fasd -e micro --f"' >> "$CUSTOM_ALIASES"
    echo "Added alias 'mm' for 'fasd -e micro --f'."
else
    echo "Alias 'mm' for 'fasd -e micro --f' already exists."
fi

echo "micro setup complete."
