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

# color
case "$TERM" in
xterm-color*-256color) color_prompt=yes ;;
esac
if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi
if [ "$color_prompt" = yes ]; then
  # shellcheck disable=SC2154
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
