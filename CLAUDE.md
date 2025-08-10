# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles and development environment setup repository that uses Ansible for automated system configuration. The repository provides a complete development environment setup for Ubuntu/Debian systems with focus on terminal-based workflows using Neovim, Zsh, and i3 window manager.

## Installation and Setup Commands

### Bootstrap Installation
```bash
# Remote installation (downloads and runs setup)
bash <(curl https://raw.githubusercontent.com/mgouzenko/configs/master/bootstrap.sh)

# Local installation (from cloned repository)
./install.sh
```

### Manual Ansible Execution
```bash
# Run the full Ansible playbook with sudo privileges
ansible-playbook -i ansible/hosts ansible/install.yml \
    --ask-become-pass \
    --ssh-extra-args='-o "StrictHostKeyChecking no"' \
    --extra-vars="dotfiles=$HOME/configs/config user=$USER"
```

### Docker Development Environment
```bash
# Build and run containerized environment
docker build -t configs .
docker run -it configs
```

## Architecture

### Core Components

1. **Ansible Automation (`ansible/`)**
   - `install.yml`: Main playbook that orchestrates the entire setup
   - `hosts`: Defines localhost as target for local installation
   - `roles/base-environment/`: Single role containing all configuration tasks

2. **Configuration Files (`config/`)**
   - `nvim/init.vim`: Neovim configuration with extensive plugin setup
   - `zsh/zshrc`: Zsh shell configuration using Antigen plugin manager

3. **Legacy Dotfiles (`dotfiles_to_port/`)**
   - Contains older configuration files for various applications
   - `symlinks.json`: Mapping of configuration files to their target locations
   - Includes i3, rofi, conky, and other application configs

### Ansible Role Structure

The `base-environment` role performs these key tasks:
- Installs system packages (defined in `defaults/main.yml`)
- Sets up Neovim with vim-plug and auto-installs plugins
- Configures Zsh as default shell with Antigen plugin manager
- Installs Pure prompt theme
- Sets up NVM and Node.js
- Installs Claude Code CLI via npm
- Generates SSH keys
- Configures ZDOTDIR for Zsh

### System Packages Installed

The role installs these packages via apt:
- Development tools: `neovim`, `git`, `python3-pip`, `curl`
- Terminal utilities: `zsh`, `htop`, `ranger`, `glances`, `tree`, `fzy`, `ncdu`, `tldr`
- Window manager: `i3`, `rofi`
- Fun utilities: `sysvbanner`

### Key Configuration Highlights

**Neovim Setup:**
- Uses vim-plug for plugin management
- Extensive plugin configuration for development
- LSP support via nvim-lspconfig
- Custom key bindings and visual enhancements

**Zsh Configuration:**
- Antigen plugin manager with oh-my-zsh framework
- Syntax highlighting, autosuggestions, and completions
- Pure prompt theme
- Custom aliases and environment variables

## Development Workflow

1. **Making Changes**: Modify configuration files in `config/` directory
2. **Testing**: Use the Docker environment for safe testing
3. **Deployment**: Run `./install.sh` to apply changes via Ansible
4. **Version Control**: The repository uses standard Git workflow

## File Organization

- **Entry Points**: `bootstrap.sh` (remote) and `install.sh` (local)
- **Automation**: All setup logic is in Ansible playbook and role
- **Active Configs**: Current configurations are in `config/`
- **Legacy Configs**: Older configs in `dotfiles_to_port/` for potential migration
- **Documentation**: Installation command in `README.txt`

## Important Notes

- The setup is designed for Ubuntu/Debian systems
- Requires sudo access for system package installation and shell changes  
- NVM and Node.js are installed for JavaScript development
- The configuration assumes a terminal-centric development workflow
- All installations are automated through Ansible for reproducibility