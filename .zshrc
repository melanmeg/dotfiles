#!/bin/zsh

# shellcheck disable=SC1090
find ~/.my/aliases/ -type f -print | while read -r file; do
  [ -f "$file" ] && source "$file"
done