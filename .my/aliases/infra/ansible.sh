#!/bin/bash

# ansible
alias play="ansible-playbook -f 30 --key-file ~/.ssh/main -i hosts site.yml -e 'ansible_python_interpreter=/usr/bin/python3'"
alias playc="ansible-playbook -f 30 --key-file ~/.ssh/main -i hosts site.yml -C -e 'ansible_python_interpreter=/usr/bin/python3'"
