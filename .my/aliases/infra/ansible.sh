#!/bin/bash

# ansible
alias play="ansible-playbook --key-file ~/.ssh/main -i hosts site.yml"
alias playc="ansible-playbook --key-file ~/.ssh/main -i hosts site.yml -C"
alias play-env="ansible-playbook -f 30 --key-file ~/.ssh/main -i hosts site.yml -e 'ansible_python_interpreter=/usr/bin/python3'"
alias playc-env="ansible-playbook -f 30 --key-file ~/.ssh/main -i hosts site.yml -C -e 'ansible_python_interpreter=/usr/bin/python3'"

# with inventory
alias iplay="ansible-playbook --key-file ~/.ssh/main -i inventory.yml site.yml"
alias iplayc="ansible-playbook --key-file ~/.ssh/main -i inventory.yml site.yml -C"
