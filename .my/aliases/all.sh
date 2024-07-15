#!/bin/sh

# git
alias gitpush='git add -A && git commit -m "submit" && git push origin main'

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

# ansible
alias play='ansible-playbook -i hosts site.yml'
alias playc='ansible-playbook -i hosts site.yml -C'
alias pplay='ANSIBLE_FORKS=20 ansible-playbook -i hosts site.yml'
alias pplayc='ANSIBLE_FORKS=20 ansible-playbook -i hosts site.yml -C'

# terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfs='terraform show .terraform/state.tfstate'
alias tfl='terraform state list -state=.terraform/state.tfstate'
alias tfp='terraform plan -state=.terraform/state.tfstate'
alias tfa='terraform apply --auto-approve -state=.terraform/state.tfstate'
alias tfd='terraform destroy --auto-approve -state=.terraform/state.tfstate'
alias tfr='terraform refresh -state=.terraform/state.tfstate'

# clear
alias clr='rm ~/.ssh/known_hosts'
alias mclear='echo 3 > /proc/sys/vm/drop_caches'

# ssh
alias basessh='ssh root@192.168.11.11'

# python
alias pyformat='pysen run format && pysen run lint'

# iostat
alias myio="iostat -cdmhNtz 1"

# k6
alias format='npm run format --prefix ./scenarios/'
perf() {
  docker-compose run k6 -c "
  k6 --url https://localhost \
    --username admin \
    --password admin \
    --out-dir /result \
    api/*/*/${1}.js
  "
}
perfall() {
  npm run format --prefix ./scenarios/
  docker-compose build
  docker-compose run k6 -c "
  k6 --url https://localhost \
    --username admin \
    --password admin \
    --out-dir /result \
    api/*/*/${1}.js
  "
}

# grep
# alias grepclean"grep -v -e '^\s*#' -e '^\s*$'"

mypsqlcolumn() {
  docker-compose exec database psql -U pguser database -P 'pager=off' -c "select column_name from information_schema.columns where table_schema = 'public' AND table_name = '$1';"
}

# keygen
alias keygen='ssh-keygen -t ed25519 -C "" -f ./keygen -N ""'
