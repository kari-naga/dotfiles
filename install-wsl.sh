#!/bin/bash

### WSL install script

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZDOTDIR="${BASEDIR}/.zsh"

# zsh
ln -s ${BASEDIR}/wsl/.zshrc ~/.zshrc
ln -s ${BASEDIR}/.p10k.zsh ~/.p10k.zsh
ln -s ${ZDOTDIR} ~/.zsh
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# git
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig

# antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR}/.antidote
