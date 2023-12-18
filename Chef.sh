#!/bin/bash

# Update package manager
sudo apt update

# Install dependencies
sudo apt install -y wget apt-transport-https

# Add Chef APT repository
wget -q https://packages.chef.io/files/stable/chef-workstation/21.12.619/chef-workstation_21.12.619-1_amd64.deb
sudo dpkg -i chef-workstation_21.12.619-1_amd64.deb
sudo apt install -f

# Display Chef version
echo "Chef Workstation version: $(chef --version)"

# Clean up downloaded package
rm -f chef-workstation_21.12.619-1_amd64.deb

# Display installation completion message
echo "Chef Workstation has been successfully installed."
