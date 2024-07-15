# ================================
#  Loading file
# ================================

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ================================
#  Other zsh settings
# ================================

setopt IGNOREEOF
setopt no_beep

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
#  Aliases
# ================================

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

# ================================
#  Environment variables
# ================================

export TIME_STYLE='+%F %T'
export EDITOR='vim'
export VISUAL='vim'
export LESS='-iRW'

# ================================
#  Added settings
# ================================

# tmux
# alias kill='tmux kill-session'
# if [[ ! "$TERM" =~ "screen" ]]; then
#   tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session
# fi

# .colorrc
eval $(dircolors -b ~/.colorrc)
alias ls='ls --color=auto'

# prezto
autoload -Uz promptinit
promptinit
prompt cloud
