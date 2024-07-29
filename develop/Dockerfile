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
ARG CACHEBURST=1
RUN git clone https://github.com/melanmeg/dotfiles.git

# Install shell
RUN sed -i '/ffmpeg\|gcloud\|azure-cli\|perl\|ansible-base/s/^/#/' ./dotfiles/.mise.toml
RUN USER=myuser HOME=/home/myuser ./dotfiles/.bin/dotfiles -b
RUN USER=myuser HOME=/home/myuser USER=myuser HOME=/home/myuser ./dotfiles/.bin/mise_and_docker.sh
# RUN USER=myuser HOME=/home/myuser ./dotfiles/.bin/recommend_cli_install.sh
# RUN USER=myuser HOME=/home/myuser ./dotfiles/.bin/install-recommended-vscode-extensions.sh
# RUN USER=myuser HOME=/home/myuser ./dotfiles/.bin/zsh_setup.sh

# After zsh comands
# $ zsh
# $ peco --version