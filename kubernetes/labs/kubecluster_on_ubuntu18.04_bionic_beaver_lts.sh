#!/usr/bin/env bash

#
#
# kubecluster_on_ubuntu18.04_bionic_beaver_lts.sh
# r2d2c3p0
# v1.0.0
# Kubernetes cluster(1/2) setup on Ubuntu 18.04 (Bionic Beaver LTS)
# 7/10/2019
#
#

# On the Kube master node, initialize the cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# That command may take a few minutes to complete. When it is done, set up the local kubeconfig:
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Verify that the cluster is responsive and that Kubectl is working on Master, on Nodes only Client version is printed.
kubectl version

''' You should get Server Version as well as Client Version. It should look something like this:
Client Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.2", GitCommit:"17c77c7898218073f14c8d573582e8d2313dc740", GitTreeState:"clean", BuildDate:"2018-10-24T06:54:59Z", GoVersion:"go1.10.4", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.2", GitCommit:"17c77c7898218073f14c8d573582e8d2313dc740", GitTreeState:"clean", BuildDate:"2018-10-24T06:43:59Z", GoVersion:"go1.10.4", Compiler:"gc", Platform:"linux/amd64"}
The kubeadm init command should output a kubeadm join command containing a token and hash. Copy that command and run it with sudo on both worker nodes. It should look something like this'''

sudo kubeadm join $some_ip:6443 --token $some_token --discovery-token-ca-cert-hash $some_hash

# Verify that all nodes have successfully joined the cluster on Master.
kubectl get nodes

# You should see all three of your nodes listed. It should look something like this:
'''
NAME                      STATUS     ROLES    AGE     VERSION
wboyd1c.mylabserver.com   NotReady   master   5m17s   v1.12.2
wboyd2c.mylabserver.com   NotReady   <none>   53s     v1.12.2
wboyd3c.mylabserver.com   NotReady   <none>   31s     v1.12.2
'''

#end_kubecluster_on_ubuntu18.04_bionic_beaver_lts.sh
