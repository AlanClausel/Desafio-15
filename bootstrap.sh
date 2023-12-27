#!/bin/bash

#Docker Install
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#Use docker without sudo
sudo groupadd docker
sudo usermod -aG docker vagrant 
newgrp docker

# Hadolint install
wget -O hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
sudo mv hadolint /usr/local/bin/hadolint
sudo chmod +x /usr/local/bin/hadolint

# Install Jenkins and Java
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install fontconfig openjdk-11-jre -y
sudo apt-get install jenkins -y

# Use Jenkins without sudo
sudo groupadd docker
sudo usermod -aG docker jenkins
newgrp docker
