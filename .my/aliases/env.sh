#!/bin/bash

export TIME_STYLE='+%F %T'
export EDITOR='vim'
export VISUAL='vim'
unset LESS

# mise env
eval "$(~/.local/bin/mise activate bash)"

# poetry env
# VENV_PATH=$(poetry env info --path --directory "$HOME/.my/poetry")
VENV_PATH="$HOME/.cache/pypoetry/virtualenvs"
for dir in "$VENV_PATH"/*/bin; do
  [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]] && PATH="$dir:$PATH"
done

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

# nodejs env
NODE_MODULE_PATH="$HOME/.my/nodejs/node_modules/.bin"
if [[ ":$PATH:" != *":$NODE_MODULE_PATH:"* ]]; then
  export PATH="$PATH:$NODE_MODULE_PATH"
fi

# golang env
if [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi