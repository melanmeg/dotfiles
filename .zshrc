#!/bin/zsh

for file in ~/.my/aliases/{,/*}; do
  # shellcheck disable=SC1090
  [ -f "$file" ] && source "$file"
done