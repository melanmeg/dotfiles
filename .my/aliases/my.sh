#!/bin/bash

# git
# shellcheck disable=SC2139
alias branchclean="git fetch --prune && git branch -v | grep \\[gone] | awk '{print $1}' | xargs git branch -d"

# clear
alias clr='rm -f ~/.ssh/known_hosts*'
alias mclear='echo 3 | sudo tee /proc/sys/vm/drop_caches'

# keygen
alias keygen='ssh-keygen -t ed25519 -C "" -f ./keygen -N ""'

# grep
alias grepclean="grep -v -e '^\s*#' -e '^\s*$'" # grepclean [file]

# cheat
alias cheat='vim ~/.my/cheatsheet.sh'
alias cheatvim='vim ~/.my/cheatsheet_vim.sh'

# tcpdump
alias mytcpdump='sudo tcpdump -ntq'
# (e.g., tcpdump -A -t -n -i eth1 port 80 and host 192.168.11.11)
