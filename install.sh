#!/usr/bin/env bash
set -e

if [ -e "$HOME/configs" ]; then
  echo "Exists: $HOME/configs"
  exit 1
fi

git clone https://www.github.com/mgouzenko/configs.git configs

if ! [ -x "$(command -v ansible)" ]; then
  sudo apt-get update
  sudo apt-get -y install ansible
fi

ansible-playbook -i ./ansible/hosts ./ansible/install.yml --ask-become-pass --ssh-extra-args='-o "StrictHostKeyChecking no"'
