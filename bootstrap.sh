#!/usr/bin/env bash

# Installation:
# bash <(curl https://raw.githubusercontent.com/mgouzenko/configs/master/bootstrap.sh)

CONFIGS=$HOME/configs

if [ -e "$CONFIGS" ]; then
  echo "Exists: $CONFIGS"
  exit 1
fi

sudo apt-get install -y software-properties-common git python3 python3-pip
python3 -m pip install ansible
git clone https://www.github.com/mgouzenko/configs.git $CONFIGS

$CONFIGS/install.sh
