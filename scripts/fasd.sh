#!/bin/bash

# Exit on error
set -e

echo "Setting up fasd..."

# Update package list if not already updated
if [ -z "$APT_UPDATED" ]; then
    sudo apt-get update
    export APT_UPDATED=1
fi

# Install fasd
if ! command -v fasd &> /dev/null; then
    sudo apt-get install -y fasd
    echo "fasd installed successfully."
else
    echo "fasd is already installed."
fi

# Ensure fasd is initialized in .zshrc if using zsh
if [ -n "$ZSH_VERSION" ]; then
    if ! grep -q 'eval "$(fasd --init auto zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"' "$HOME/.zshrc"; then
        echo 'eval "$(fasd --init auto zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"' >> "$HOME/.zshrc"
        echo "Added fasd initialization to .zshrc"
    else
        echo "fasd initialization already present in .zshrc"
    fi
# Ensure fasd is initialized in .bashrc if using bash
elif [ -n "$BASH_VERSION" ]; then
     if ! grep -q 'eval "$(fasd --init auto zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"' "$HOME/.bashrc"; then
        echo 'eval "$(fasd --init auto zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"' >> "$HOME/.bashrc"
        echo "Added fasd initialization to .bashrc"
    else
        echo "fasd initialization already present in .bashrc"
    fi
fi


echo "fasd setup complete." 