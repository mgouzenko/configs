#!/usr/bin/env bash

CONFIGS=$HOME/configs

if [ -e "$CONFIGS" ]; then
  echo "Exists: $CONFIGS"
  exit 1
fi

git clone https://www.github.com/mgouzenko/configs.git $CONFIGS

if ! [ -x "$(command -v ansible)" ]; then
  sudo apt-get install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt-get -y install ansible
  ansible-galaxy collection install community.crypto
fi

$CONFIGS/install.sh
