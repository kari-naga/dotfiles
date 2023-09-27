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
find "${ENVDIR}" -maxdepth 1 -print "%P\n" | while read file; do ln -sf "${ENVDIR}/$file" "$file"; done
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# git
ln -sf "${BASEDIR}/.gitconfig" ~/.gitconfig

# ssh
if [[ $ENV != "codespaces" ]]; then
    ln -sf "${BASEDIR}/ssh_config" ~/.ssh/config
fi
