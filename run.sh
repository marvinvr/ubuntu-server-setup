#!/bin/bash

# Exit on error
set -e

# Run apt-get update once at the beginning and set environment variable
echo "Updating package lists..."
sudo apt-get update
export APT_UPDATED=1

# Function to download and run a script
run_script() {
    local script_name="$1"
    local script_url="https://raw.githubusercontent.com/marvinvr/ubuntu-server-setup/main/scripts/${script_name}.sh"
    echo "Running ${script_name} script..."
    # Download the script and pipe it directly to sh for execution
    if curl -fsSL "$script_url" | sh; then
        echo "${script_name} script finished."
    else
        echo "Error running ${script_name} script." >&2
        # set -e will handle exit, but explicit message helps
        exit 1
    fi
}

# Run scripts
run_script "zsh"
run_script "batcat"
run_script "eza"
run_script "btop"
run_script "tailscale"
run_script "fzf"
run_script "fasd"
run_script "micro"

echo "Setup complete!"