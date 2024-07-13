#!/bin/bash -eux

sudo apt purge -y needrestart
sudo timedatectl set-timezone Asia/Tokyo
sudo systemctl restart rsyslog

# mirror set riken
sudo sed -i.bak -r 's!http://(security|us.archive).ubuntu.com/ubuntu!http://ftp.riken.jp/Linux/ubuntu!' /etc/apt/sources.list

sudo apt update -y && apt upgrade -y

# set inputrc
echo "set bell-style none" | sudo tee -a /etc/inputrc
