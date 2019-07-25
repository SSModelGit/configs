#!/bin/bash

# Install basic packages
bash package-setup.sh

# Setup the emacs alias
mkdir -p ~/.emacs.d/themes/
cp init.el ~/.emacs.d/init.el
wget https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el
mv zenburn-theme.el ~/.emacs.d/themes/
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc
source ~/.bashrc

# remind about manual git configuration
echo "------------"
echo "Reminder: git still needs to know who you are!"
echo "git config --global user.email \"user.email@host.thing\" && git config --global user.name \"Name1 Name2\""
echo "------------"
