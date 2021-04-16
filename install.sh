#!/usr/bin/env bash
set -e

CONFIGS=$HOME/configs

if [ -e "$CONFIGS" ]; then
  echo "Exists: $CONFIGS"
  # exit 1
fi

# git clone https://www.github.com/mgouzenko/configs.git $CONFIGS

if ! [ -x "$(command -v ansible)" ]; then
  sudo apt-get update
  sudo apt-get -y install ansible
fi

ansible-playbook -i $CONFIGS/ansible/hosts $CONFIGS/ansible/install.yml --ask-become-pass --ssh-extra-args='-o "StrictHostKeyChecking no"'
