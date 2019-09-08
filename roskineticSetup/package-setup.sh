#!/bin/bash

# Package setup script
# Installs packages, required for each new container

# Install common container packages
bash ../commonSetup/package-setup.sh

# Add rosemacs package for emacs
apt -y install ros-kinetic-rosemacs

# Install ros packages
apt install -y ros-kinetic-mavros* ros-kinetic-joy

# Install python packages for virtual env
apt install -y python-pip python-dev build-essential
pip install --upgrade python pip virtualenv
apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
