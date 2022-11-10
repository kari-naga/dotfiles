#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
ln -sf ${BASEDIR}/.zshrc ~/.zshrc
ln -sf ${BASEDIR}/.p10k.zsh ~/.p10k.zsh
ln -sf ${BASEDIR}/.zsh ~/.zsh

# git
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig

# antigen
curl -L git.io/antigen > ~/.zsh/antigen.zsh