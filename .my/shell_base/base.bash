#!/bin/bash
set -euo pipefail

# ================================
#  Added settings
# ================================

# tmux
# alias kill='tmux kill-session'
# if [[ ! "$TERM" =~ "screen" ]]; then
#   tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session
# fi

# .colorrc
# shellcheck disable=SC2046
eval $(dircolors -b ~/.colorrc)
alias ls='ls --color=auto'

# set mise
eval "$(~/.local/bin/mise activate bash)"
