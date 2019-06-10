#!/bin/bash

mkdir ~/.emacs.d/
ln ../init.el ~/.emacs.d/init.el
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc
source ~/.bashrc
