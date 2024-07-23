FROM ubuntu:24.04

RUN apt update && apt upgrade -y
RUN apt install -y git vim curl wget

USER root
WORKDIR /root

# zsh
RUN apt install -y zsh tmux
RUN chsh -s "$(which zsh)"

# prezto
RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
RUN zsh -c 'setopt EXTENDED_GLOB'
RUN zsh -c 'for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do; ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"; done'

# peco
RUN curl -L -o /peco_linux_amd64.tar.gz https://github.com/peco/peco/releases/download/v0.5.10/peco_linux_amd64.tar.gz
RUN tar xvf /peco_linux_amd64.tar.gz -C /
RUN mv /peco_linux_amd64/peco /usr/local/bin/
RUN rm -rf /peco_linux_amd64.tar.gz /peco_linux_amd64

# git clone
ARG CACHEBUST=1
RUN git clone https://github.com/melanmeg/dotfiles.git

# After comands
# $ zsh
# $ peco --version