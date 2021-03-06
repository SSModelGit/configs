#!/bin/bash

### Standard setup work
# Install packages
bash package-setup.sh

# Perform common container configs
bash ../commonSetup/volume-setup.sh

# Add Python configuration file to init.el
mkdir ~/.emacs.d/pylisp
cp ../custom-emacs/py-config.el ~/.emacs.d/pylisp/py-config.el
echo "" >> ~/.emacs.d/init.el
echo ";; Load Python setup from custom config source file" >> ~/.emacs.d/init.el
echo "(load-file \"~/.emacs.d/pylisp/py-config.el\")" >> ~/.emacs.d/init.el

### Begin ros-kinetic specific setup work
# Set it up / enable in the init.el config file for emacs
echo "" >> ~/.emacs.d/init.el
echo "(add-to-list 'load-path \"/opt/ros/kinetic/share/emacs/site-lisp\")" >> ~/.emacs.d/init.el
echo "(require 'rosemacs-config)" >> ~/.emacs.d/init.el

# Enter the repos folder
cd ~/repos/

# Clone personal git repositories
git clone https://github.com/ModROS/modelica_bridge.git
git clone https://github.com/ModROS/modelica_bridge_examples.git

# Clone OARS repo (because it also is ROS work)
git clone https://github.com/olin-robotic-sailing/trans-atlantic-sailboat.git

# Setup catkin workspace

mkdir ~/catkin_ws/ && mkdir ~/catkin_ws/src/ && cd ~/catkin_ws/src/
ln -s ~/repos/modelica_bridge modelica_bridge
ln -s ~/repos/modelica_bridge_examples modelica_bridge_examples
ln -s ~/repos/trans-atlantic-sailboat trans-atlantic-sailboat

# # Now build
cd .. && catkin_make
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Creating Python2.7 virtual environment for ROS development
rosdep update

mkdir ~/.virtualenvs
virtualenv -p python2.7 --system-site-packages ~/.virtualenvs/rosk

echo "source /opt/ros/kinetic/setup.bash" >> ~/.virtualenvs/rosk/bin/activate
echo "export PYTHONPATH=\$PYTHONPATH:catkin_ws" >> ~/.virtualenvs/rosk/bin/activate

venv_activate=~/.virtualenvs/rosk/bin/activate
echo "alias rosk='source $venv_activate'" >> ~/.bashrc
echo "rosk" >> ~/.bashrc
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
