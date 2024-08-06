#!/bin/zsh

# shellcheck disable=SC1090
for file in ~/.my/zsh/*; do
  [ -f "$file" ] && source "$file"
done

files=$(find ~/.my/aliases/ -type f -print)
# shellcheck disable=SC1090
for file in $files; do
  [ -f "$file" ] && source "$file"
done