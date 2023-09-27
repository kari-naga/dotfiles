# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE="${ZDOTDIR}/.histfile"
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${ZDOTDIR}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='ls --color=auto'

source "${ZDOTDIR}/ssh-agent.zsh"

source "${ZDOTDIR}/.antidote/antidote.zsh"
antidote load

autoload -Uz promptinit
promptinit
prompt powerlevel10k

[[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source "${ZDOTDIR}/.p10k.zsh"
