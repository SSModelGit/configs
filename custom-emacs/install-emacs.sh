#!/bin/bash

# Install the software common properties package to be able to add PPAs
apt update
apt install -y software-properties-common

# Install the better version of emacs
add-apt-repository ppa:kelleyk/emacs -y
apt update
apt install -y emacs25
