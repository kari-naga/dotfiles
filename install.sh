#!/bin/bash

### Install script

# setup variables
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZDOTDIR=~/.config/zsh
ENV="native"
if [[ $CODESPACES ]]; then
    ENV="codespaces"
elif [[ -f /etc/wsl.conf ]]; then
    ENV="wsl"
fi
ENVDIR="${BASEDIR}/${ENV}"

# zsh
ln -sf "${BASEDIR}/zsh" "${ZDOTDIR}"
git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR}/.antidote"
find "${ENVDIR}" -mindepth 1 -path "${ENVDIR}/overwrite" -prune -o -printf "%P\n" | while read file; do ln -sf "${ENVDIR}/$file" "${ZDOTDIR}/$file"; done
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# git
GITCONFIG="${BASEDIR}/.gitconfig"
OVERWRITE="${ENVDIR}/overwrite/.gitconfig"
if [[ -f OVERWRITE ]]; then
    GITCONFIG="${OVERWRITE}"
fi
ln -sf "${GITCONFIG}" ~/.gitconfig

# ssh
if [[ $ENV != "codespaces" ]]; then
    SSHCONFIG="${BASEDIR}/ssh_config"
    OVERWRITE="${ENVDIR}/overwrite/ssh_config"
    if [[ -f OVERWRITE ]]; then
        SSHCONFIG="${OVERWRITE}"
    fi
    ln -sf "${SSHCONFIG}/ssh_config" ~/.ssh/config
fi
