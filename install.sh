#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
ln -s ${BASEDIR}/.zshrc ~/.zshrc
ln -s ${BASEDIR}/p10k.zsh ~/.p10k.zsh
ln -s ${BASEDIR}/.zsh ~/.zsh

# git
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig

# antigen
curl -L git.io/antigen > ~/.zsh/antigen.zsh