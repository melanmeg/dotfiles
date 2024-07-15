#!/bin/sh

alias sudo='sudo '
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -laFh'
alias history='history -niD'
alias which='which -a'
alias zmv='noglob zmv -W'
alias showclock='watch -n 60 date'
alias psqltsv='psql -AF $'\''\t'\'''

# git
alias gitpush='git add -A && git commit -m "submit" && git push origin main'

# clear
alias clr='rm ~/.ssh/known_hosts'
alias mclear='echo 3 > /proc/sys/vm/drop_caches'

# ssh
alias basessh='ssh root@192.168.11.11'
