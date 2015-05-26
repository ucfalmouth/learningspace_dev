#!/usr/bin/env bash
# https://github.com/FMCorz/mdk

sudo apt-get install python-pip libmysqlclient-dev libpq-dev python-dev
cd /opt
sudo git clone git://github.com/FMCorz/mdk.git moodle-sdk
sudo pip install -r /opt/moodle-sdk/requirements.txt
sudo chmod +x /opt/moodle-sdk/mdk.py
sudo ln -s /opt/moodle-sdk/mdk.py /usr/local/bin/mdk

# cd ~/
# mkdir downloads
# cd downloads
# # http://bit.ly/1ISTyl5
# wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
# sudo python ez_setup.py
# sudo easy_install pip
# sudo pip install moodle-sdk
# sudo mdk init
# #sudo pip install --upgrade moodle-sdk
# # wget https://bootstrap.pypa.io/get-pip.py