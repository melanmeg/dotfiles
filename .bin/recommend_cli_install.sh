#!/bin/bash
set -eu

# 工事中

# Setup my poetry
# - thefuck
# - glances
# - speedtest-cli
poetry install --directory "$HOME/.my/poetry" --no-root
# poetry debug (delete)
# rm -rf "$(poetry env list --full-path --directory "$HOME/.my/poetry" | grep -o '/.*')"

# - aria2
sudo apt install -y aria2

# - bandwhich # ネットワーク帯域幅の使用状況をリアルタイムで監視
PACKAGE_NAME=bandwhich
aria2c -d /tmp -x 16 -s 16 -k 1M -o $PACKAGE_NAME.tar.gz https://github.com/imsnif/bandwhich/releases/download/v0.22.2/bandwhich-v0.22.2-x86_64-unknown-linux-musl.tar.gz \
  tar -xzf /tmp/$PACKAGE_NAME.tar.gz -C /tmp \
  sudo cp -a /tmp/$PACKAGE_NAME /usr/local/bin \
  rm -rf /tmp/$PACKAGE_NAME*

# - gping
sudo apt install -y gping

# - lagydocker
PACKAGE_NAME=lazydocker
aria2c -d /tmp -x 16 -s 16 -k 1M -o $PACKAGE_NAME.tar.gz https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_x86_64.tar.gz \
  tar -xzf /tmp/$PACKAGE_NAME.tar.gz -C /tmp \
  sudo cp -a /tmp/$PACKAGE_NAME /usr/local/bin \
  rm -rf /tmp/$PACKAGE_NAME*

# - figlet # ASCIIアート

# - lolcat # テキストを虹色に

# - actionlint # GitHub Actions の Workflow ファイルの静的検査

# - aicommits # コミットメッセージを自動生成

# - cLive # ターミナル操作を自動化

# - genact # 忙しいフリをする

# - gh # GitHub CLI

# - hyperfine -> Installed from mise

# - charming (rust)

# - farm

# - pocketbase

# - go-zero
