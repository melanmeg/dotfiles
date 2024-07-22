#!/bin/zsh

for file in ~/.my/shell_base/base.zsh; do
  source "$file"
done

for file in ~/.my/aliases/*; do
  source "$file"
done

for file in ~/.my/mise.sh; do
  source "$file"
done