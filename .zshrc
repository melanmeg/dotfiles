# ================================
#  Loading file
# ================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Executes commands at the start of an interactive session.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# ================================
#  Loading zsh function
# ================================

# # Enable compinit.
# autoload -Uz compinit
# compinit
#
# # Enable powerlevel10k.
# autoload -Uz promptinit
# promptinit
# prompt powerlevel10k
#
# # Enable cdr.
# # cf. http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-cdr
# autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
# add-zsh-hook chpwd chpwd_recent_dirs
# zstyle ':completion:*:*:cdr:*:*' menu selection
# zstyle ':completion:*' recent-dirs-insert both
# zstyle ':chpwd:*' recent-dirs-max 500
# zstyle ':chpwd:*' recent-dirs-default true
# zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME:-$HOME/.cache}/shell/chpwd-recent-dirs"
# zstyle ':chpwd:*' recent-dirs-pushd true
#
# # Enable zmv
# autoload -Uz zmv

# ================================
#  Other zsh settings
# ================================

# ignore C-D logout
setopt IGNOREEOF

# silent
setopt no_beep

# ================================
#  Keybinds
# ================================

# C-U: Same as Bash
## Change before: kill-whole-line
bindkey \^U backward-kill-line

# C-R: peco-history-selection
## Change before: history-incremental-search-backward
function peco-history-selection {
  BUFFER=$(\history -nr 1 | peco)
  CURSOR=${#BUFFER}
}
zle -N peco-history-selection
bindkey \^R peco-history-selection

# C-S: peco-cdr-selection
## Change before: history-incremental-search-forward
function peco-cdr-selection {
  BUFFER="cd $(cdr -l | awk '{ print $2 }' | peco)"
  CURSOR=${#BUFFER}
}
zle -N peco-cdr-selection
bindkey \^S peco-cdr-selection

# ================================
#  Aliases
# ================================

# use alias with sudo
# cf. https://manpages.debian.org/bullseye/manpages-ja/bash.1.ja.html#alias~2
alias sudo='sudo '

# -i ... force pre-execution confirmation
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# -l ... long listing
# -a ... list entries starting with .
# -F ... append file type indicators for /
# -h ... print sizes in human readable form
alias ll='ls -laFh'

# -n ... suppress line numbers
# -i ... yyyy-mm-dd format time-stamps
# -D ... print elapsed times
alias history='history -niD'

# -a ...  print all occurrences in path
alias which='which -a'

# noglob ... Do not expand meta characters.
# -W ... Use wildcards without parentheses
alias zmv='noglob zmv -W'

# Show clock
## If you don't want to stop the SSH session.
alias showclock='watch -n 60 date'

# psql tsv output
# SHOULD TEST ME
alias psqltsv='psql -AF $'\''\t'\'''

# ================================
#  Environment variables
# ================================

# Date and time format
## longer: YYYY-MM-DD W hh:mm:ss Z
### export TIME_STYLE='+%F %a %T %Z'
## middle: YYYY-MM-DD hh:mm:ss
export TIME_STYLE='+%F %T'
## shorter: MM-DD hh:mm
### export TIME_STYLE='+%m-%d %H:%M'

# Overwrite .zprofile (Prezto)
export EDITOR='vim'
export VISUAL='vim'

# less
## -i ... ignore case in searches that lack uppercase
## -R ... display control chars; keep track of screen effects
## -W ... highlight first unread line after forward movement
## (-S ... truncate long lines instead of folding)
export LESS='-iRW'

# ================================
#  Added settings
# ================================

# .colorrc
eval $(dircolors -b ~/.colorrc)
alias ls='ls --color=auto'

#tmux
# alias kill='tmux kill-session'
# if [[ ! "$TERM" =~ "screen" ]]; then
#   tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session
# fi

# tmp
# mkdir -p ~/.cache/shell && touch ~/.cache/shell/chpwd-recent-dirs
