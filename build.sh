#!/bin/bash

# Install dependencies

BUILD_PKGS="supervisor git python-pip python-virtualenv libmpfr-dev libssl-dev libmpc-dev libffi-dev build-essential libpython-dev python2.7-minimal python-setuptools authbind python2.7"

apt-get update
apt-get install -y ${BUILD_PKGS}
apt-get clean

# Create a user account
groupadd --gid 1000 cowrie
useradd -m --uid 1000 --gid 1000 -d /home/cowrie -m cowrie

# Install & Setup Virtual Environment
su - cowrie -c "\
cd && \
git clone https://github.com/micheloosterhof/cowrie && \
cd /home/cowrie/cowrie && \
virtualenv cowrie-env && \
source cowrie-env/bin/activate && \
pip install -r /home/cowrie/cowrie/requirements.txt "

# Generate a DSA key
cd /home/cowrie/cowrie/data
ssh-keygen -t dsa -b 1024 -f ssh_host_dsa_key

cd /home/cowrie
chown -R cowrie:cowrie /home/cowrie



