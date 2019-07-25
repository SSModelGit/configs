#!/bin/bash

# Package setup script
# Installs packages, required for each new container

# Install the software common properties package to be able to add PPAs
apt update
apt install -y software-properties-common

# Install the better version of emacs
bash install-emacs.sh
