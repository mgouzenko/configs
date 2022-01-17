#!/usr/bin/env bash

# Installation:
# bash <(curl https://raw.githubusercontent.com/mgouzenko/configs/master/bootstrap.sh)

CONFIGS=$HOME/configs

if [ -e "$CONFIGS" ]; then
  echo "Exists: $CONFIGS"
  exit 1
fi

sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get -y install git python3
python3 -m pip install --user ansible

git clone https://www.github.com/mgouzenko/configs.git $CONFIGS

$CONFIGS/install.sh
