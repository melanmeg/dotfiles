#!/bin/sh

# ansible
alias play='ansible-playbook -i hosts site.yml'
alias playc='ansible-playbook -i hosts site.yml -C'
alias pplay='ANSIBLE_FORKS=20 ansible-playbook -i hosts site.yml'
alias pplayc='ANSIBLE_FORKS=20 ansible-playbook -i hosts site.yml -C'
