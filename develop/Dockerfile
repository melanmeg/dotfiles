FROM ubuntu:24.04

# Init Setup
RUN sed -i.bak -r 's!http://(security|archive).ubuntu.com/ubuntu!http://ftp.riken.go.jp/Linux/ubuntu!' /etc/apt/sources.list.d/ubuntu.sources
RUN apt upgrade -yU
RUN apt purge -y needrestart
RUN apt install -y git vim curl wget sudo
RUN echo "set bell-style none" | tee -a /etc/inputrc
RUN chmod -x /etc/update-motd.d/*

# Init User
RUN useradd -m myuser
RUN usermod -aG sudo myuser
RUN echo 'myuser ALL=(ALL) NOPASSWD:ALL' | tee /etc/sudoers.d/myuser

# myuser
USER myuser
WORKDIR /home/myuser

# git clone
ARG CACHEBUST=1
RUN git clone https://github.com/melanmeg/dotfiles.git

# Install Shell
RUN ./dotfiles/.bin/dotfiles -b
# RUN ./dotfiles/.bin/mise_and_docker.sh
# RUN ./dotfiles/.bin/recommend_cli_install.sh
# RUN ./dotfiles/.bin/install-recommended-vscode-extensions.sh
# RUN ./dotfiles/.bin/zsh_setup.sh

# zsh After comands
# $ zsh
# $ peco --version