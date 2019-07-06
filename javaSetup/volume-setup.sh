#!/bin/bash

### Standard setup work

# Install basic packages
# This installs Oracle JDK 11 as the JDK package
bash package-setup.sh

# Setup the emacs alias
mkdir ~/.emacs.d/
cp ../init.el ~/.emacs.d/init.el
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc

### Begin java specific setup
# Specify the $JAVA_HOME path
echo "source /etc/environment" >> ~/.bashrc

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
