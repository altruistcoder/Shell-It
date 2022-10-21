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


# Installing Helm
echo "Installing Helm"
LATEST_TAG=$(curl -s https://api.github.com/repos/helm/helm/releases/latest | jq .tag_name | tr -d \")
HELM_PACKAGE="helm-$LATEST_TAG-linux-amd64.tar.gz"
HELM_DOWNLOAD_URL="https://get.helm.sh/$HELM_PACKAGE"
wget $HELM_DOWNLOAD_URL
if [ $? == 0 ]
then
    tar -zxvf $HELM_PACKAGE
    mv linux-amd64/helm /usr/bin
    helm version
    helm repo add bitnami https://charts.bitnami.com/bitnami
else
    echo "Could not download Helm, please check URL or internet connectivity"
fi


# Installing ZSH & ohmyzsh🙂
echo "Installing ZSH & ohmyzsh🙂"
apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "ZSH & ohmyzsh installed"
