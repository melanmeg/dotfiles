#!/bin/bash

# mise env
eval "$(~/.local/bin/mise activate bash)"

# poetry env
# VENV_PATH=$(poetry env info --path --directory "$HOME/.my/poetry")
VENV_PATH="$HOME/.cache/pypoetry/virtualenvs/*"
export PATH="$PATH:$VENV_PATH/bin"

# thefuck
# eval "$(thefuck --alias)"
# shellcheck disable=SC2112,SC2155,SC2046,SC2086
function fuck() {
  TF_PYTHONIOENCODING=$PYTHONIOENCODING
  export TF_SHELL=bash
  export TF_ALIAS=fuck
  export TF_SHELL_ALIASES=$(alias)
  export TF_HISTORY=$(fc -ln -10)
  export PYTHONIOENCODING=utf-8
  TF_CMD=$(
    thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
  ) && eval "$TF_CMD"
  unset TF_HISTORY
  export PYTHONIOENCODING=$TF_PYTHONIOENCODING
  history -s $TF_CMD
}
