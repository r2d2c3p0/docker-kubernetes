#!/usr/bin/env bash

#
#
# kube_on_ubuntu18.04_bionic_beaver_lts.sh
# r2d2c3p0
# v1.0.0
# Installation instructions for Kubernetes on Ubuntu 18.04 (Bionic Beaver LTS)
# 7/10/2019
#
#

# Get the GPG key for the kubernetes installation.
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Add kubernetes repository to the apt tool.
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

# Update the packages.
sudo apt-get update

# Install and freeze the kubernetes version due to kubeadm compatibility concerns.
sudo apt-get install -y kubelet=1.12.7-00 kubeadm=1.12.7-00 kubectl=1.12.7-00

# Verify that kubernetes is working by running this command:
sudo apt-mark hold kubelet kubeadm kubectl

#end_kube_on_ubuntu18.04_bionic_beaver_lts.sh
