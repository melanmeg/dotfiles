#!/bin/bash -u

shell_setup() {
  echo "shell setup started."
  apt update
  apt install -y zsh tmux
  chsh -s "$(which zsh)"
  echo -e "\e[1;32m zsh setup completed. \e[m"

  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  zsh -c '
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
  '
  echo -e "\e[1;32m prezto setup completed. \e[m"

  curl -L -o /peco_linux_amd64.tar.gz https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
  tar xvf /peco_linux_amd64.tar.gz -C /
  mv /peco_linux_amd64/peco /usr/local/bin/
  rm -rf /peco_linux_amd64.tar.gz /peco_linux_amd64
  echo -e "\e[1;32m peco setup completed. \e[m"
}

main() {
  shell_setup
  echo -e "\e[1;36m Setup completed!!!! \e[m"
  zsh
  peco --version
}

main "$@"
