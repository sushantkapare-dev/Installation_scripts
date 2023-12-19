#!/bin/bash

# Update the package list
sudo apt-get update

# Install dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Initialize Docker Swarm (replace with your desired IP address)
sudo docker swarm init --advertise-addr <your-node-ip>

# Get the join token for worker nodes (optional)
join_token=$(sudo docker swarm join-token -q worker)

# Display instructions for joining worker nodes
echo "Swarm initialized. To join worker nodes, use the following command:"
echo "sudo docker swarm join --token $join_token <your-manager-ip>:2377"
