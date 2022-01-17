#!/usr/bin/env bash
set -e

CONFIGS=$HOME/configs
DEFAULT_USER="gouzenko"

ansible-playbook -i $CONFIGS/ansible/hosts $CONFIGS/ansible/install.yml \
	--ask-become-pass \
	--ssh-extra-args='-o "StrictHostKeyChecking no"' \
	--extra-vars="dotfiles=$CONFIGS/config user=${USER-$DEFAULT_USER}"

exec zsh
