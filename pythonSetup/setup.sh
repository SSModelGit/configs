# Creating Python2.7 virtual environment for ROS development

apt -y install python-pip python-dev build-essential
pip install --upgrade python pip virtualenv

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
