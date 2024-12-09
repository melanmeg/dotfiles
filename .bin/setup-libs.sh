#!/bin/bash
set -eux

#
# ※ このスクリプトは、./dotfiles配下、以外のディレクトリで実行してください。
#

# ================================
# Install Docker, dokcer-compose
# ================================

sudo curl -fsSL https://get.docker.com | sh
# shellcheck disable=SC2046
sudo curl -L https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add docker Group
sudo usermod -aG docker "$USER"
# 権限が反映しない場合
# newgrp docker


# ================================
# Install Rust
# ================================
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# depend
sudo apt install -y build-essential gcc-aarch64-linux-gnu
~/.cargo/bin/rustup target add x86_64-unknown-linux-musl
~/.cargo/bin/rustup target add aarch64-unknown-linux-musl


# ================================
# Install ansible
# ================================

# ref: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pipx
#    : https://ansible.readthedocs.io/projects/lint/installing/#installing-the-latest-version
sudo apt install -y pipx
pipx install --include-deps ansible
pipx install -y ansible-core ansible-lint
# Upgrading
# pipx upgrade --include-injected ansible

# create ansible Group
sudo groupadd -g 9010 ansible

# Add ansible Group
sudo usermod -aG ansible "$USER"
# 権限が反映しない場合
# newgrp ansible


# ================================
# Install mise
# ================================

# # Often stuck for dependency. libs in mise
sudo apt install -y unzip bzip2 nasm yasm gcc

curl https://mise.run | sh

function mise_cmd() {
  ~/.local/bin/mise i -y
  ~/.local/bin/mise use -y azure-cli@latest
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
