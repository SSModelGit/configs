#!/bin/bash

# Package setup script
# Installs packages, required for each new container

# Install the software common properties package to be able to add PPAs
apt update
apt install -y software-properties-common

# Install the better version of emacs
bash ../custom-emacs/install-emacs.sh

# Install packages for Python virtual envs
apt -y install python-pip python-dev build-essential
pip install --upgrade python pip virtualenv
