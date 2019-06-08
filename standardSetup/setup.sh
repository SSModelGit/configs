#!/bin/bash

ln ../init.el ~/.emacs.d/init.el
echo "em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc
