#!/bin/sh
set -eu

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
