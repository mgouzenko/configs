#!/usr/bin/env bash
set -e

if ! [ -x "$(command -v ansible)" ]; then
  sudo apt-get update
  sudo apt-get -y install ansible
fi
