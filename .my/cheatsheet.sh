#!/bin/bash
#################################
#   Alt Shell                   #
#################################
dust           : like a du.
bat            : like a cat.
exa            : like a ls.
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
wsl --install  : Install WSL.
wsl -l -v      : List WSL.
wsl            : Start WSL.
wsl --shutdown : Shutdown WSL.

$ sudo adduser melanmeg
$ sudo usermod -aG sudo melanmeg
$ sudo visudo
  melanmeg ALL=(ALL) NOPASSWD: ALL

share: \\wsl$\Ubuntu

$ sudo vim /etc/wsl.conf
[boot]
systemd=true
[automount]
enable = false
root = /home/melanmeg
[network]
hostname = wsl
generateResolvConf = false
[user]
default = melanmeg

$ sudo rm -f /etc/resolv.conf
$ sudo echo 'nameserver 8.8.8.8 1.1.1.1' > /etc/resolv.conf

$ wsl --shutdown
$ wsl

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
#   infra                       #
#################################
aws            : AWS CLI.
az             : Azure CLI.
gcloud         : Google Cloud CLI.
trivy          : vulnerability assessment tool.

# Aliases
tf             : alias "terraform"
playc          : alias "ansible-playbook --key-file ~/.ssh/... -i hosts site.yml -C"
               : (e.g., playc -D -l hoge1)
dc             : alias "docker-compose"
wdcp           : alias "watch docker-compose ps -a"
dcall          : cycle docker-compose.
drm, drmi      : all delete containers, images.
deli           : all delete docker including cache.
mytcpdump      : alias "sudo tcpdump -ntq"
               : (e.g., tcpdump -A -t -n -i eth1 port 80 and host 192.168.11.11)
mytrap         : alias, trap 'echo "+ $BASH_COMMAND"' DEBUG
deltrap        : alias, trap '' DEBUG

# Survey
lsof                                  : (e.g., lsof -i :10250)
trap 'echo "+ $BASH_COMMAND"' DEBUG   : 以降のコマンドを標準出力
trap -p                               : trap status check
trap '' [1]*                          : trap delete ([1]* e.g., 0, 1, 2, DEBUG, SIGTERM, SIGUP)
# すべてのトラップを削除ではなく、１個ずつの方が良さそう
# trap '' 0 1 2 3 15  : Clear all traps

# System Cache Commands
  mclear         : alias "sync; echo 3 | sudo tee /proc/sys/vm/drop_caches"
    # 1: ページキャッシュ 解放
    # 2: dentry、inode 解放
    # 3: ページキャッシュ、dentry、inode 解放
    # この操作は非破壊的な操作で、ダーティな (dirty) オブジェクトは解放されないので、この操作を行う際は最初に sync を実行しておくべきである。
    # ref: https://pooh.gr.jp/?p=5477
  sudo slabtop -o # キャッシュの状態を確認
  slabtop --once --sort=c | head -n 20
  myslabtop      : alias "sudo cat /proc/slabinfo | grep "dentry\|obj" | awk '{ for (i=1; i<=NF; i++) { a[NR,i] = $i } } NF>p { p = NF } END { for(j=1; j<=p; j++) { str=a[1,j]; for(i=2; i<=NR; i++){ str=str"\t"a[i,j-1]; } print str } }' | grep '<'"
  sar -v 0       : dentunusd が negative dentry の数
  sudo cat /proc/sys/fs/dentry-state # デンタリキャッシュの状態を確認
  # デンタリキャッシュの状態
  # 1. nr_dentry: dentryの数
  # 2. nr_unused: 未使用のdentryの数
  # 3. age_limit: メモリが不足している場合に次に dcache entry を再要求できるようになるまでの残り時間 (秒数)
  # 4. want_pages: dentryのために必要なページ数
  # 5. dummy
  # 6. dummy
  # slabキャッシュとは ref: https://qiita.com/bezeklik/items/7e1ac9e5da39261be7bd
  mymeminfo       : alias "awk '/kB/ {printf "%-20s %10.2f GB\n", $1, $2 / 1024 / 1024}' /proc/meminfo | grep -v 0.00"
  awk '
  /^Cached:|^Active\(file\):|^Inactive\(file\):|^KReclaimable:|^Slab:|^SReclaimable:/ {
      printf "%-20s %10.2f GB\n", $1, $2 / 1024 / 1024
  }' /proc/meminfo

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

#################################
#   VSCode                      #
#################################
# Ctrl+Shift+P
  Developer: Show Running Extensions
    実行中の拡張機能の読み込み速度
  Developer: Startup Performance
    起動パフォーマンスのプロファイリング

'
