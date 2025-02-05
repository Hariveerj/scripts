#!/bin/bash

####################  java is mandatory for the jenkins and master and node configration   #####################

# Update package list
apt update

# Install fontconfig and OpenJDK 17
apt install -y fontconfig openjdk-17-jre

# Verify Java installation
java -version

################################################################################################################

# Download Jenkins keyring
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to sources list
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list again
sudo apt-get update

# Install Jenkins
sudo apt-get install -y jenkins