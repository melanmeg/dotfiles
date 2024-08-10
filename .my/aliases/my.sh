#!/bin/bash

# git
# shellcheck disable=SC2139
alias branchclean="git fetch --prune && git branch -v | grep \\[gone] | awk '{print $1}' | xargs git branch -d"

# clear
alias clr='rm ~/.ssh/known_hosts'
alias mclear='sudo echo 3 > /proc/sys/vm/drop_caches'

# keygen
alias keygen='ssh-keygen -t ed25519 -C "" -f ./keygen -N ""'

# grep
alias grepclean="grep -v -e '^\s*#' -e '^\s*$'" # grepclean [file]

# cheat
alias cheat='vim ~/.my/cheatsheet.sh'
alias cheatvim='vim ~/.my/cheatsheet_vim.sh'
