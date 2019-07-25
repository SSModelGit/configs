#!/bin/bash

# Package setup script
# Installs packages, required for each new container

# Install common container packages
bash ../commonSetup/package-setup.sh

# Install packages for Python virtual envs
apt -y install python-pip python-dev python3.5-dev build-essential
pip install --upgrade python pip virtualenv
