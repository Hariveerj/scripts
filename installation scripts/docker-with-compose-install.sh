#!/bin/bash

# Remove any old Docker packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    sudo apt-get remove -y $pkg
done

# Update the package list and install prerequisites
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Set up Docker's official GPG key and repository
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again and install Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Set up Docker Compose manually with default path
sudo mkdir -p /root/.docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-linux-x86_64 -o /root/.docker/cli-plugins/docker-compose

# Make Docker Compose executable
sudo chmod +x /root/.docker/cli-plugins/docker-compose

# Create a symbolic link to make Docker Compose accessible system-wide
sudo ln -s /root/.docker/cli-plugins/docker-compose /usr/local/bin/docker-compose


#check the docker-compose version
docker-compose --version