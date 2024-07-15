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
prompt skwp
