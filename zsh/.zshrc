#!/usr/bin/env zsh
if [[ ${DOTFILES_DEBUG} == "on" ]]; then
  zmodload zsh/zprof && zprof
fi
mkdir -p "${ZDOTDIR}" "${ZCACHEDIR}" "${ZSTATEDIR}"

# autoload
autoload -Uz compinit ${ZDOTDIR}/functions/*

# Z shell
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt EXTENDED_HISTORY
setopt transient_rprompt

bindkey -e

# Depends on: Homebrew
if ! command type brew >/dev/null 2>&1; then
  log.error "Homebrew is not installed"
  return 1
fi

# TODO: この辺なんとかしたい
source ${ZDOTDIR}/zshrc/brew.zsh

brew require nvim neovim || return 1
export EDITOR="nvim"

# Depends on: sheldon
brew require sheldon || return 1
SHELDON_CACHE="${ZCACHEDIR}/sheldon.cache"
if [[ ! -f "${SHELDON_CACHE}" || "${XDG_CONFIG_HOME}/sheldon/plugins.toml" -nt "${SHELDON_CACHE}" ]]; then
  sheldon source > "${SHELDON_CACHE}"
  log.info "Cache created ${SHELDON_CACHE}"
fi
if [[ ! -f "${SHELDON_CACHE}.zwc" || "${SHELDON_CACHE}" -nt "${SHELDON_CACHE}.zwc" ]]; then
  zcompile "${SHELDON_CACHE}"
  log.info "Recompiled ${SHELDON_CACHE}"
fi

source "${SHELDON_CACHE}"
unset SHELDON_CACHE

# Ctrl-s, Ctrl-q等をshellに食われないようにする
stty -ixon

# Distinct PATH
typeset -U PATH

ZSHRC="${(%):-%x}"
if [[ ${ZSHRC} -nt ${ZSHRC}.zwc ]]; then
  zcompile ${ZSHRC}
  log.info "Recompiled ${ZSHRC}"
fi
unset ZSHRC

if [[ ${DOTFILES_DEBUG} == "on" ]]; then
  zprof
fi
