#!/bin/bash
#################################
#   Commands                    #
#################################
aws organizations list-accounts : AWS CLI auth list.
az account show                 : Azure CLI auth list.
gcloud auth list                : Google Cloud CLI auth list.

# mise
mise doctor : syntax check.

#################################
#   Aliases                     #
#################################
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

#################################
#   History                     #
#################################
export HISTTIMEFORMAT="%F %T "
history -w
cat ~/.bash_history

#################################
#   Survey                      #
#################################
lsof                                  : (e.g., lsof -i :10250)
trap 'echo "+ $BASH_COMMAND"' DEBUG   : 以降のコマンドを標準出力
trap -p                               : trap status check
trap '' [1]*                          : trap delete ([1]* e.g., 0, 1, 2, DEBUG, SIGTERM, SIGUP)
# すべてのトラップを削除ではなく、１個ずつの方が良さそう
# trap '' 0 1 2 3 15  : Clear all traps

#################################
#   System Cache                #
#################################
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
#   GPG                         #
#################################
gpg --pinentry-mode loopback --passphrase passwd --quick-gen-key "melanmeg <example@example.com>" default default 0
gpg --list-keys
gpg --delete-key "melanmeg (test) <example@example.com>"
gpg --delete-secret-key "melanmeg (test) <example@example.com>"

#################################
#   SOPS                         #
#################################
sops -e test.yaml > test.enc.yaml
sops -d test.enc.yaml > test.dec.yaml
gcloud kms keyrings create sops --location global
gcloud kms keys create sops-key --location global --keyring sops --purpose encryption
gcloud kms keys list --location global --keyring sops
sops -e --gcp-kms projects/PROJECT_ID/locations/global/keyRings/sops/cryptoKeys/sops-key test.yaml > test.enc.yaml
sops -d test.enc.yaml > test.dec.yaml
# .sops.yaml
# creation_rules:
#   - pgp: "32FDE15D2580AAB6242FDF74464639D09000866C"


'
