#!/bin/bash
set -eu

sudo apt install -y unzip bzip2

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install mise
curl https://mise.run | sh

eval "$(~/.local/bin/mise activate bash)"
mise use -gy azure-cli@latest
mise i -y