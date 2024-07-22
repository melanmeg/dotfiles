#!/bin/sh
set -eu

# ansible
alias play='ansible-playbook --key-file ~/.ssh/main -i hosts site.yml'
alias playc='ansible-playbook --key-file ~/.ssh/main -i hosts site.yml -C'
alias pplay='ANSIBLE_FORKS=20 ansible-playbook --key-file ~/.ssh/main -i hosts site.yml'
alias pplayc='ANSIBLE_FORKS=20 ansible-playbook --key-file ~/.ssh/main -i hosts site.yml -C'
