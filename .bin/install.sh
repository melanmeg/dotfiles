#!/bin/bash

set -eu

if [ ! -d "$HOME/.dotbackup" ];then
  echo "$HOME/.dotbackup not found. Auto Make it"
  mkdir "$HOME/.dotbackup"
fi

for f in .??*; do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitconfig" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" =~ .swp$ ]] && continue
  if [[ -L "$HOME/`$f`" ]];then
    rm -f "$HOME/`$f`"
  fi
  if [[ -e "$HOME/`$f`" ]];then
    mv "$HOME/`$f`" "$HOME/.dotbackup"
  fi

  ln -snf $f $HOME
done
