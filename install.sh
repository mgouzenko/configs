#!/usr/bin/env bash
set -e

CONFIGS=$HOME/configs

ansible-playbook -i $CONFIGS/ansible/hosts $CONFIGS/ansible/install.yml \
	--ask-become-pass \
	--ssh-extra-args='-o "StrictHostKeyChecking no"' \
	--extra-vars="dotfiles=$CONFIGS/config user=$USER"
