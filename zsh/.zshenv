#!/usr/bin/env zsh

# Disable global .zshrc
unsetopt GLOBAL_RCS

# Debugging
export DOTFILES_DEBUG=off

# XDG Base Directory Specification
# See: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Z Shell
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZCACHEDIR="${XDG_CACHE_HOME}/zsh"
export ZSTATEDIR="${XDG_STATE_HOME}/zsh"

# History
export HISTFILE="${ZSTATEDIR}/history"
export HISTSIZE=10000
export SAVEHIST=10000000

###########
# Toolbox #
###########
# Homebrew
export HOMEBREW_PREFIX=$([[ "$(uname -m)" = "arm64" ]] && echo "/opt/homebrew" || echo "/usr/local")
export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
export HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"

# Homebrew Bundle
export HOMEBREW_BUNDLE_FILE="${XDG_CONFIG_HOME}/homebrew/Brewfile"
export HOMEBREW_BUNDLE_FILE_GLOBAL="${XDG_CONFIG_HOME}/homebrew/Brewfile"

# mise
export MISE_DATA_DIR="${XDG_DATA_HOME}/mise"
export PHP_CONFIGURE_OPTIONS="--with-openssl=${HOMEBREW_PREFIX}/opt/openssl@3 --with-iconv=${HOMEBREW_PREFIX}/opt/libiconv --with-readline=${HOMEBREW_PREFIX}/opt/readline"

# Docker Compose
export COMPOSE_BAKE=true

# AI Agents Home Directory
export CODEX_HOME=${XDG_CONFIG_HOME}/codex
export SERENA_HOME=${XDG_DATA_HOME}/serena

#########
# Paths #
#########
typeset -U path PATH
path=(
  ${MISE_DATA_DIR}/shims(N-/)
  ${HOMEBREW_PREFIX}/bin(N-/)
  ${HOMEBREW_PREFIX}/sbin(N-/)
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /usr/sbin
  /bin
  /sbin
)

typeset -U manpath MANPATH
manpath=(
  ${HOMEBREW_PREFIX}/share/man(N-/)
  /usr/local/share/man
  /usr/share/man
)

typeset -U infopath INFOPATH
infopath=(
  ${HOMEBREW_PREFIX}/share/info(N-/)
)
