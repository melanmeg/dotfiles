#!/bin/bash
set -eu

sudo apt install -y unzip bzip2 # nasm yasm gcc

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install mise
curl https://mise.run | sh

eval "$(~/.local/bin/mise activate bash)"
mise i -y
mise use -gy azure-cli@latest