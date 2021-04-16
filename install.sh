#!/usr/bin/env bash
set -e

CONFIGS=$HOME/configs

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Install antigen
curl -L git.io/antigen > $HOME/.zsh/antigen.zsh

# Install command line prompt
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure" || true

ansible-playbook -i $CONFIGS/ansible/hosts $CONFIGS/ansible/install.yml \
	--ask-become-pass \
	--ssh-extra-args='-o "StrictHostKeyChecking no"' \
	--extra-vars="dotfiles=$CONFIGS/config user=$USER"
