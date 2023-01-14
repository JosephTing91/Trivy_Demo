#!/bin/bash
# Installing Jenkins
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins -y
#dont want to give root to jenkins as that is not best practice security-wise
# sudo echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Installing Git
sudo yum install git -y

#for amazon linux 2
sudo yum install docker -y
#enable docker service at boot
sudo systemctl enable docker.service
sudo systemctl start docker.service

#Add group membership for the default jenkins user so you can run all docker commands without using the sudo command:
sudo usermod -a -G docker jenkins
id jenkins
# Reload a Linux user's group assignments to docker w/o logout
newgrp docker

#install trivy
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/master/contrib/install.sh | sh -s -- -b /usr/bin
