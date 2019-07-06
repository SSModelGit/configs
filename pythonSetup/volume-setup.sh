#!/bin/bash

### Standard setup work

# Install basic packages
bash package-setup.sh 

# Setup the emacs alias
mkdir ~/.emacs.d/
cp ../init.el ~/.emacs.d/init.el
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc

# Add Python configuration file to init.el
mkdir ~/.emacs.d/pylisp
cp ../custom-emacs/py-config.el ~/.emacs.d/pylisp/py-config.el
echo "" >> ~/.emacs.d/init.el
echo ";; Load Python setup from custom config source file" >> ~/.emacs.d/init.el
echo "(load-file \"~/.emacs.d/pylisp/py-config.el\")" >> ~/.emacs.d/init.el

# Creating Python virtual environments (2.7 and 3.5)

mkdir ~/.virtualenvs
virtualenv -p python2.7 --system-site-packages ~/.virtualenvs/pyfoo
virtualenv -p python3.5 --system-site-packages ~/.virtualenvs/pybar

venv2_activate=~/.virtualenvs/pyfoo/bin/activate
venv3_activate=~/.virtualenvs/pybar/bin/activate
echo "alias pyfoo='source $venv2_activate'" >> ~/.bashrc
echo "alias pybar='source $venv3_activate'" >> ~/.bashrc
source ~/.bashrc

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
