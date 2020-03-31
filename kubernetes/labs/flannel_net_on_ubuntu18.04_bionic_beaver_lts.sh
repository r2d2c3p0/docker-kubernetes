#!/usr/bin/env bash

#
#
# flannel_net_on_ubuntu18.04_bionic_beaver_lts.sh
# r2d2c3p0
# v1.0.0
# Setup Flannel Network inside Kubernetes cluster(1/2) deployed on Ubuntu 18.04 (Bionic Beaver LTS)
# 7/10/2019
#
#

# Execute below command on all nodes.
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Install Flannel in the cluster by running this only on the Master node.
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

# Verify that all the nodes now have a STATUS of Ready.
kubectl get nodes

'''
You should see all three of your servers listed, and all should have a STATUS of Ready. It should look something like this:
NAME                      STATUS     ROLES    AGE     VERSION
wboyd1c.mylabserver.com   Ready      master   5m17s   v1.12.2
wboyd2c.mylabserver.com   Ready      <none>   53s     v1.12.2
wboyd3c.mylabserver.com   Ready      <none>   31s     v1.12.2
Note: It may take a few moments for all nodes to enter the Ready status, so if they are not all Ready, wait a few moments and try again. It is also a good idea to verify that the Flannel pods are up and running. Run below command to get a list of system pods
'''
kubectl get pods -n kube-system

# You should have three pods with flannel in the name, and all three should have a status of Running.

#end_flannel_net_on_ubuntu18.04_bionic_beaver_lts.sh