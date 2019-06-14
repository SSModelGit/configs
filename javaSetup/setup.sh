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
cp ../custom-emacs/java-config.el ~/.emacs.d/javalisp/java-config.el
echo "" >> ~/.emacs.d/init.el
echo ";; Load Java setup from custom config source file" >> ~/.emacs.d/init.el
echo "(load-file \"~/.emacs.d/javalisp/java-config.el\")" >> ~/.emacs.d/init.el

# Source .bashrc
source ~/.bashrc 

# remind about manual git configuration
echo "------------"
echo "Reminder: git still needs to know who you are!"
echo "git config --global user.email \"user.email@host.thing\" && git config --global user.name \"Name1 Name2\""
echo "------------"
