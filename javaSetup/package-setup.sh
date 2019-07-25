#!/bin/bash

# Package setup script
# Installs packages, required for each new container

# Install common container packages
bash ../commonSetup/package-setup.sh

# Install Java (Oracle JDK 11)
add-apt-repository ppa:linuxuprising/java
apt update
apt install oracle-java11-installer

# # Specify the $JAVA_HOME path
echo "JAVA_HOME=/usr/lib/jvm/java-11-oracle/bin/java" >> /etc/environment

# Install maven
apt update
apt install -y maven
