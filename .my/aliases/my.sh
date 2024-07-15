#!/bin/sh

# python
alias pyformat='pysen run format && pysen run lint'

# iostat
alias myio="iostat -cdmhNtz 1"

# grep
alias grepclean="grep -v -e '^\s*#' -e '^\s*$'"

mypsqlcolumn() {
  docker-compose exec database psql -U pguser database -P 'pager=off' -c "select column_name from information_schema.columns where table_schema = 'public' AND table_name = '$1';"
}

# keygen
alias keygen='ssh-keygen -t ed25519 -C "" -f ./keygen -N ""'

######### ADD ##########
