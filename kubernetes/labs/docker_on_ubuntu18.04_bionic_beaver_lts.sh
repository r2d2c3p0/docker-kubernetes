#!/usr/bin/env bash

#
#
# docker_on_ubuntu18.04_bionic_beaver_lts.sh
# r2d2c3p0
# v1.0.0
# Installation instructions for Docker on Ubuntu 18.04 (Bionic Beaver LTS)
# 7/10/2019
#
#

# Get the GPG key for the docker installation.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker repository to the apt tool.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the packages.
sudo apt-get update

# Install and freeze the docker version due to kubeadm compatibility concerns.
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
sudo apt-mark hold docker-ce

# Verify that docker is working by running this command:
sudo docker version

#end_docker_on_ubuntu18.04_bionic_beaver_lts.sh