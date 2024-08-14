#!/bin/bash
set -eux


# ================================
# Install Docker, dokcer-compose
# ================================

sudo curl -fsSL https://get.docker.com | sh
# shellcheck disable=SC2046
sudo curl -L https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add docker Group
sudo usermod -aG docker "$USER"


# ================================
# Install Rust
# ================================
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# depend
sudo apt install -y build-essential
~/.cargo/bin/rustup target add x86_64-unknown-linux-musl


# ================================
# Install ansible
# ================================

# ref: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pipx
#    : https://ansible.readthedocs.io/projects/lint/installing/#installing-the-latest-version
sudo apt install -y pipx
pipx install --include-deps ansible
pipx install ansible-lint
# Upgrading
# pipx upgrade --include-injected ansible

# create ansible Group
sudo groupadd -g 9010 ansible

# Add ansible Group
sudo usermod -aG ansible "$USER"


# ================================
# Install mise
# ================================

# depend libs in mise
sudo apt install -y unzip bzip2 # ffmpeg depend on gcc nasm yasm

curl https://mise.run | sh

function mise_cmd() {
  ~/.local/bin/mise i -y
  # ~/.local/bin/mise use -gy azure-cli@latest
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
