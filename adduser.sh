#!/bin/bash

# Exit on error
set -e

# Check if user mvr exists
if ! id "mvr" &>/dev/null; then
    echo "Creating user mvr..."
    # Create user mvr
    sudo adduser mvr --gecos ""
    
    # Add to sudo group
    sudo usermod -aG sudo mvr
    
    # Create .ssh directory and set permissions
    sudo mkdir -p /home/mvr/.ssh
    sudo chmod 700 /home/mvr/.ssh
    
    echo "Fetching SSH keys from GitHub..."
    # Fetch SSH keys from GitHub and add to authorized_keys
    curl -fsSL https://github.com/marvinvr.keys | sudo tee /home/mvr/.ssh/authorized_keys
    
    # Set correct ownership and permissions
    sudo chown -R mvr:mvr /home/mvr/.ssh
    sudo chmod 600 /home/mvr/.ssh/authorized_keys
    
    echo "User mvr created successfully with SSH keys from GitHub!"
else
    echo "User mvr already exists."
fi
