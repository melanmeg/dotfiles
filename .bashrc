#!/bin/bash

# ================================
#  Required settings for bash
# ================================

case $- in
*i*) ;;
*) return ;;
esac

[ -z "$PS1" ] && return
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# shellcheck disable=SC2223
: ${__vsc_first_prompt:=default_value}
if [ "$__vsc_first_prompt" == "some_condition" ]; then
  true
fi

# ================================
#  load settings
# ================================

# shellcheck disable=SC1090
find ~/.my/aliases/ -type f -print | while read -r file; do
  [ -f "$file" ] && source "$file"
done