#!/bin/sh

set -eu

# check terminal
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# lesspipe
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#   debian_chroot=$(cat /etc/debian_chroot)
# fi

# tput color_prompt
# if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#   color_prompt=yes
# else
#   color_prompt=
# fi

# terminal coler by $TERM
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# Prompt color settings
if [ "$color_prompt" = yes ]; then
  ### Termial Prompt Custom Color Settings    ↓↓↓↓↓↓                           ↓↓↓↓↓↓
  PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;165m\]\u@\h\[\033[00m\]:\[\033[38;5;208m\]\w\[\033[00m\]\$ '
  PS2='\[\033[01;34m\]> \[\033[00m\]'
  # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' # default
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# bash auto complete
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
if [ -f ~/.bash_aliases ]; then
  # shellcheck disable=SC1090
  . ~/.bash_aliases
fi
# shellcheck disable=SC3044
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    # shellcheck disable=SC1091
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    # shellcheck disable=SC1091
    . /etc/bash_completion
  fi
fi
