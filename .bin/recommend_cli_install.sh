#!/bin/bash
set -eu

# setup mypoetry
# - thefuck
# - glances
poetry install --directory "$HOME/.my/poetry"
VENV_PATH=$(poetry env info --path --directory "$HOME/.my/poetry")
export PATH=$PATH:$VENV_PATH/bin

# - aria2
sudo apt install -y aria2

# - bandwhich # ネットワーク帯域幅の使用状況をリアルタイムで監視
aria2c -d /tmp -x 16 -s 16 -k 1M https://github.com/imsnif/bandwhich/releases/download/v0.22.2/bandwhich-v0.22.2-x86_64-unknown-linux-musl.tar.gz \
  tar -xzf /tmp/bandwhich-v0.22.2-x86_64-unknown-linux-musl.tar.gz -C /tmp \
  sudo cp -a /tmp/bandwhich /usr/local/bin \
  rm -rf /tmp/bandwhich*

# - gping

# - speedtest-cli

# - lagydocker

# - ngroc

# - figlet # ASCIIアート

# - lolcat # テキストを虹色に

# - hyperfine -> Installed from mise

# - charming (rust)

# - farm ?

# - pocketbase

# - go-zero
