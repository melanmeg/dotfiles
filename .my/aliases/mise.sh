#!/bin/sh

eval "$(~/.local/bin/mise activate bash)"

if [ -f "$HOME/.env" ]; then
  # shellcheck disable=SC3046,SC1091,SC2086
  source "$HOME/.env"
fi

if [ "$RUST_CLI_ALIAS" = "true" ]; then
  alias du='dust'
  alias cat='bat'
  alias ls='exa'
  alias find='fd'
  alias df='duf'
  alias procs='ps'
  alias top='bottom'
  # alias cd='zoxide'
  alias grep='ripgrep'
fi
