#!/bin/bash

# Recheck repositories, add software common properties package for PPAs
apt update
apt install -y software-properties-common

# Install emacs and rosemacs
bash ../install-emacs.sh
apt -y install ros-kinetics-rosemacs

# Install ros packages
apt install -y ros-kinetic-mavros* ros-kinetic-joy

# Install python packages for virtual env
apt install -y python-pip python-dev build-essential
pip install --upgrade python pip virtualenv

apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential

# remind about manual installation process
echo "------------"
echo "Reminder: autopep8 installation must happen manually for each virtualenv"
echo "After entering virtualenv, use the following command:"
echo "pip install autopep8"
echo "Do this for all virtualenvs"
echo "------------"

# remind about manual git configuration
echo "------------"
echo "Reminder: git still needs to know who you are!"
echo "git config --global user.email \"user.email@host.thing\" && git config --global user.name \"Name1 Name2\""
echo "------------"

