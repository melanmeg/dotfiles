#!/bin/bash
#################################
#   Alt Shell                   #
#################################
dust           : like a du.
bat            : like a cat.
fd             : like a find.
procs          : like a ps.
bottom         : like a top.
zoxide         : like a cd.
ripgrep        : like a grep.
aria2          : The ultra fast download utility (e.g., aria2c -d /tmp -x 16 -s 16 -k 1M -o $filename $URL)
gping          : Ping, but with a graph.

#################################
#   WSL                         #
#################################
wsl --install -d : Install WSL.
wsl -l -v        : List WSL.
wsl -s           : set default WSL.
wsl              : Start WSL.
wsl -t           : 指定したWSLを終了する。
wsl --shutdown   : すべてのWSLを終了する。

# 名称指定する場合
wsl --install -d Ubuntu-24.04  # このVMで初期設定を済ます
wsl -t Ubuntu-24.04
wsl --export Ubuntu-24.04 C:\myroot\my-ubuntu-2404.tar
wsl --unregister Ubuntu-24.04
wsl --import myUbuntu1 C:\myroot\wsldata my-ubuntu-2404.tar

# 1. 作業中、WSLの起動は１つが良い
# 2. 選択中のWSLのみにDockerDesktopが適用されていそう
# 3. 両方の再起動繰り返していくと、上手くいく

$ sudo adduser melanmeg
$ sudo usermod -aG sudo melanmeg
$ sudo visudo
  melanmeg ALL=(ALL) NOPASSWD: ALL

share: \\wsl$\Ubuntu

$ sudo vim /etc/wsl.conf
[boot]
systemd = true
[automount]
enable = false
root = /home/melanmeg
[network]
hostname = wsl
generateResolvConf = false
[user]
default = melanmeg
[wsl2]  # 今のところ機能しないが、将来を見据えて一応記載
networkingMode = mirrored
firewall = false
autoProxy = true
dnsTunneling = true
dnsProxy = true

$ sudo rm -f /etc/resolv.conf
$ sudo echo 'nameserver 8.8.8.8 1.1.1.1' > /etc/resolv.conf

$ wsl --shutdown
$ wsl

# VPN接続時にTLS接続できなくなる問題の回避策（wsl.confの[wsl2]では上手くいかなかった）
# 「WSL Settings」アプリを開く > ネットワーク > ネットワークモード > Mirroredへ変更
# 「WSL Settings」アプリを開く > ネットワーク > Hyper-Vファイアウォールが有効 > オフへ変更

#################################
#   CLI                         #
#################################
fuck           : a magnificent app.
glances        : an open-source system cross-platform monitoring tool.
aicommits      : AI Commits (e.g., aicommits)
figlet         : ASCII arts (e.g., figlet Hello, World!)
bandwhich      : CLI utility for displaying current network. (e.g., sudo bandwhich)
lagydocker     : A simple terminal UI for both docker and docker-compose.
actionlint     : Static inspection of Workflow files in GitHub Actions.
clive          : Automated terminal operations. (e.g., clive start)
hyperfine      : A command-line benchmarking tool. (e.g., hyperfine --runs 5 'sleep 0.3')
genact         : a nonsense activity generator.
gh             : Github CLI.
ffmpeg         : ffmpeg.
vhs            : Write terminal GIFs as code for integration testing and demoing your CLI tools.
speedtest-cli  : Command line interface for testing internet bandwidth using speedtest.net.

#################################
#   Develop                     #
#################################
# Language
  Go, Java, Python, Perl, Zig, Rust,
# JavaScript Runtime
  Nodejs, Deno, Bun, farm
# CLI tools
poetry         : python package manager.
pocketbase     : an open source Go backend.
charming       : A Rust Visualization Library.
go-zero        : go-zero is a web and rpc framework with lots of builtin engineering practices.
# Aliases
pyformat       : python formatter.
getgotests     : go get gotests
# Github CLI
gh auth login  : login to github.
gh repo create --public : create a public repository.
gh repo delete --yes    : delete a repository.
gh auth refresh -h github.com -s delete_repo : refresh token.
gh repo list   : list repositories.
gh repo view   : view repository.
# create a new repository on CLI.
  git init -q
  git add -A
  git commit -m "first commit"
  git branch -M main
  git remote add origin https://github.com/melanmeg/$repo_name.git
  # check: git remote -v
  git push -u origin main
# an existing repository from CLI and not existing local.
  git init -q
  git add -A
  git commit -m "hoge commit"
  git branch -M hoge
  git remote add origin https://github.com/melanmeg/$repo_name.git
  git pull --no-rebase origin main --allow-unrelated-histories # or git pull --rebase origin main
  # fix conflicts from VSCode -> git commit
  git push
  # git
  git pull --merge  # コンフリクト時、先にローカルの変更を取り込む？
  git pull --rebase  # コンフリクト時、先にリモートの変更を取り込む？

#################################
#   VSCode                      #
#################################
# Ctrl+Shift+P
  Developer: Show Running Extensions
    実行中の拡張機能の読み込み速度
  Developer: Startup Performance
    起動パフォーマンスのプロファイリング

'
