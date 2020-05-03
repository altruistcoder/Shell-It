#!/bin/bash

# Installation of Docker

printf "################################################## Installation of Docker started ##################################################\n"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce -y
printf "################################################## Installation of Docker Completed ##################################################\n"

# Installation of Openshift & Kubectl

printf "################################################## Installation of Openshift and Kubectl started ##################################################\n"
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz
tar xvf openshift-client-linux.tar.gz
printf "################################################## Installation of Openshift and Kubectl Completed ##################################################\n"
echo "################################################## Moving oc and kubectl to /usr/bin/ ##################################################\n"
sudo mv oc kubectl /usr/bin

# Checking versions of Docker, Openshift & Kubectl

echo "################################################## Checking Versions ##################################################\n"
printf "\nDocker Version:"
docker --version
printf "\nOC Version:"
oc version
printf "\nKubectl Version:"
kubectl version
