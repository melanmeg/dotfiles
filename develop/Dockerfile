FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN apt install -y git vim curl wget

USER root
WORKDIR /root

RUN git clone https://github.com/melanmeg/dotfiles.git