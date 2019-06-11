#!/bin/bash

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
source ~/.bashrc
