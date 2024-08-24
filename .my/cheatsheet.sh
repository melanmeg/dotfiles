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
# Survey
lsof           : (e.g., lsof -i :10250)

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
