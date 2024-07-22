#!/bin/bash
set -eu

# Install docker
curl -fsSL https://get.docker.com | sh

# Install dokcer compose
curl -L https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

# Add docker Group
sudo usermod -aG docker "$USER"
newgrp docker

# dependency mise
sudo apt install -y unzip bzip2 # nasm yasm gcc

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install mise
curl https://mise.run | sh

# Setting mise
# shellcheck disable=SC2016
echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc

function mise_cmd () {
  mise i -y
  mise use -gy azure-cli@latest
}
for attempt in {1..3}; do
    if mise_cmd; then
        echo "mise Command succeeded."
        exit 0
    else
        echo "Attempt $attempt failed. Retrying..."
        sleep 5
    fi
done

# create ansible Group
groupadd -g 9010 ansible

# Add ansible Group
sudo usermod -aG ansible "$USER"
newgrp ansible