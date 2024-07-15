#!/bin/sh

# docker
alias d='docker'
alias dp='docker ps -a'
alias drm='docker rm -f $(docker ps -aq)'
alias drmi='docker rmi -f $(docker images -q)'
alias deli='sh -xc "docker rm -f $(docker ps -aq); docker volume prune -a -f; docker system prune -a -f"'
alias dsys='docker system df'

# docker-compose
alias dc='docker-compose'
alias dcp='docker-compose ps -a'
alias wdcp='watch docker-compose ps -a'
alias dcb='docker-compose build'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dceli='docker-compose down --rmi all --volumes --remove-orphans'
