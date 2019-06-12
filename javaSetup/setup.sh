#!/bin/bash

### Standard setup work

# Install the software common properties package to be able to add PPAs
apt update
apt install software-properties-common

# Install the better version of emacs
add-apt-repository ppa:kelleyk/emacs
apt update
apt install emacs25

# Setup the emacs alias
mkdir ~/.emacs.d/
cp ../init.el ~/.emacs.d/init.el
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc

### Begin java specific setup

# Install Java (Oracle JDK 11)
add-apt-repository ppa:linuxuprising/java
apt update
apt install oracle-java11-installer

# # Specify the $JAVA_HOME path
echo "JAVA_HOME=/usr/lib/jvm/java-11-oracle/bin/java" >> /etc/environment
echo "source /etc/environment" >> ~/.bashrc

# Install maven
apt update
apt install -y maven

# Setup the emacs init.el file to use meghanada
mkdir ~/.emacs.d/javalisp/
cp java-config.el ~/.emacs.d/javalisp/java-config.el
echo "load-file \"~/.emacs.d/java-config\"" >> ~/.emacs.d/init.el
