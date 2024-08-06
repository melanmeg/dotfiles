#!/bin/zsh

for file in ~/.my/aliases/*; do
  source "$file"
done
