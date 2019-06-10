#!/bin/bash

mkdir ~/.emacs.d/
cp ../init.el ~/.emacs.d/init.el
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc
source ~/.bashrc
