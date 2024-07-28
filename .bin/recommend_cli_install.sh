#!/bin/bash
set -eu

# Generic function to download binary files
install_package() {
  PACKAGE_NAME=$1
  URL=$2
  aria2c -d /tmp -x 16 -s 16 -k 1M -o "$PACKAGE_NAME.tar.gz" "$URL"
  tar -xzf "/tmp/$PACKAGE_NAME.tar.gz" -C /tmp
  sudo cp -a "/tmp/$PACKAGE_NAME" /usr/local/bin
  rm -rf "/tmp/$PACKAGE_NAME*"
  sudo chown "$USER:$USER" "/usr/local/bin/$PACKAGE_NAME"
  sudo chmod +x "/usr/local/bin/$PACKAGE_NAME"
}

# Setup my poetry
# - thefuck
# - glances
# - speedtest-cli
poetry install --directory "$HOME/.my/poetry" --no-root
# poetry debug (delete)
# rm -rf "$(poetry env list --full-path --directory "$HOME/.my/poetry" | grep -o '/.*')"

# Setup my nodejs
# - aicommits > コミットメッセージを自動生成
# .envにOPENAI_KEY=<your token>を設定
npm i --prefix "$HOME/.my/nodejs"

# - aria2
sudo apt install -y aria2

# - bandwhich > ネットワーク帯域幅の使用状況をリアルタイムで監視
install_package bandwhich https://github.com/imsnif/bandwhich/releases/download/v0.22.2/bandwhich-v0.22.2-x86_64-unknown-linux-musl.tar.gz

# - gping
sudo apt install -y gping

# - lagydocker
install_package lazydocker https://github.com/jesseduffield/lazydocker/releases/download/v0.23.3/lazydocker_0.23.3_Linux_x86_64.tar.gz

# - figlet > ASCIIアート
sudo apt install -y figlet # figlet Hello, World!

# - actionlint > GitHub Actions の Workflow ファイルの静的検査
install_package actionlint https://github.com/rhysd/actionlint/releases/download/v1.7.1/actionlint_1.7.1_linux_amd64.tar.gz

# - cLive > ターミナル操作を自動化
install_package clive https://github.com/koki-develop/clive/releases/download/v0.12.9/clive_Linux_x86_64.tar.gz

# - genact > 忙しいフリをする
PACKAGE_NAME=genact
sudo curl -Lo /usr/local/bin/$PACKAGE_NAME https://github.com/svenstaro/genact/releases/download/v1.4.2/genact-1.4.2-x86_64-unknown-linux-musl
sudo chown "$USER:$USER" /usr/local/bin/$PACKAGE_NAME
sudo chmod +x /usr/local/bin/$PACKAGE_NAME

# - gh > GitHub CLI
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) &&
  sudo mkdir -p -m 755 /etc/apt/keyrings &&
  wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null &&
  sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg &&
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
  sudo apt update &&
  sudo apt install gh -y

# - pocketbase
install_package clive https://github.com/pocketbase/pocketbase/releases/download/v0.22.18/pocketbase_0.22.18_linux_amd64.zip

# - charming
# cargo add charming

# - farm
# npx create farm@latest

# - go-zero
# go get -u github.com/zeromicro/go-zero

# - hyperfine -> Installed from mise
