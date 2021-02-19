#!/usr/bin/env bash
#
# This script is intended to be run from https://labs.play-with-k8s.com/ and will set up a single node kube cluster,
# install a text editor, clone the interview-prompts repo, and build the docker image.

set -o errexit
set -o nounset
set -o pipefail

kubeadm init --apiserver-advertise-address "$(hostname -i)" --pod-network-cidr 10.5.0.0/16
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
# Disable the "don't run pods on the master node" taint
kubectl taint nodes --all node-role.kubernetes.io/master-

yum install -y nano vim # Install a text editor they can use

git clone https://github.com/replicahq/interview-prompts.git
cd interview-prompts/kube-debug
docker build -t dice .
