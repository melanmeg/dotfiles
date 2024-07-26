#!/bin/zsh

# ================================
#  prezto settings
# ================================

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ================================
#  Keybinds
# ================================

bindkey \^U backward-kill-line
function peco-history-selection {
  BUFFER=$(\history -nr 1 | peco)
  CURSOR=${#BUFFER}
}
zle -N peco-history-selection
bindkey \^R peco-history-selection
function peco-cdr-selection {
  BUFFER="cd $(cdr -l | awk '{ print $2 }' | peco)"
  CURSOR=${#BUFFER}
}
zle -N peco-cdr-selection
bindkey \^S peco-cdr-selection

# ================================
#  Other zsh settings
# ================================

setopt IGNOREEOF
setopt no_beep

# ================================
#  Added settings
# ================================

# .colorrc
eval $(dircolors -b ~/.colorrc)
alias ls='ls --color=auto'

# prezto
autoload -Uz promptinit
promptinit
prompt skwp

# set mise
eval "$(~/.local/bin/mise activate bash)"
