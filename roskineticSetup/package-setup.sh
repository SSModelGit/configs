#!/bin/bash

# Package setup script
# Installs packages, required for each new container

# Install the software common properties package to be able to add PPAs
apt update
apt install -y software-properties-common

# Install the better version of emacs
bash ../custom-emacs/install-emacs.sh
apt -y install ros-kinetic-rosemacs

# Install ros packages
apt install -y ros-kinetic-mavros* ros-kinetic-joy

# Install python packages for virtual env
apt install -y python-pip python-dev build-essential
pip install --upgrade python pip virtualenv
apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
