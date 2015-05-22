#!/usr/bin/env bash
# https://github.com/FMCorz/mdk
cd ~/
mkdir downloads
cd downloads
# http://bit.ly/1ISTyl5
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
sudo python ez_setup.py
sudo easy_install pip
sudo pip install moodle-sdk
sudo mdk init
#sudo pip install --upgrade moodle-sdk
# wget https://bootstrap.pypa.io/get-pip.py