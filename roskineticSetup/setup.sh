#!/bin/bash

# Standard setup work
ln ../init.el ~/.emacs.d/init.el
echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc

# Install rosemacs
apt update && apt -y upgrade && apt -y dist-upgrade && apt -y autoremove
apt -y install ros-kinetic-rosemacs

# Set it up / enable in the init.el config file for emacs
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

# # Before calling catkin_make, install appropriate dependencies
apt install ros-kinetic-joy

# # Now build
cd .. && catkin_make
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
