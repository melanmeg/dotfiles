#!/bin/bash -eu

shell_setup() {
  echo "shell setup started."
  sudo apt install -y zsh
  chsh -s "$(which zsh)"
}

main() {
  shell_setup
  echo -e "\e[1;36m Setup completed!!!! \e[m"
  zsh
}

main "$@"
