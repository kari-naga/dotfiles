#!/bin/bash

### Install script

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZDOTDIR="${BASEDIR}/.zsh"

# zsh
if [ -z "$CODESPACES" ]; then
    ln -sf ${BASEDIR}/remote/.zshrc ~/.zshrc
    ln -sf ${BASEDIR}/remote/.zshrc $ZDOTDIR/.zshrc
    ln -sf ${BASEDIR}/remote/.p10k.zsh ~/.p10k.zsh
else
    if [ -f "/etc/wsl.conf" ]; then
        ln -sf ${BASEDIR}/wsl/.zshrc ~/.zshrc
        ln -sf ${BASEDIR}/wsl/.zshrc $ZDOTDIR/.zshrc
    else
        ln -sf ${BASEDIR}/native/.zshrc ~/.zshrc
        ln -sf ${BASEDIR}/native/.zshrc $ZDOTDIR/.zshrc
    fi
    ln -sf ${BASEDIR}/.p10k.zsh ~/.p10k.zsh
fi
ln -sf ${ZDOTDIR} ~/.zsh
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# git
ln -sf ${BASEDIR}/.gitconfig ~/.gitconfig

# antidote
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR}/.antidote
