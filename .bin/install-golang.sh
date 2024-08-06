#!/bin/bash
set -eux

# go: install/update tools
# ※Goは1系では、後方互換性が保証されている
# ※2系では、go2のようにリリースされるらしい
# ※miseでインストールするとVSCodeがGOROOT,GOPATHを要求され、認識しなくなる
sudo rm -rf /usr/local/go
TAR_FILENAME=$(curl 'https://go.dev/dl/?mode=json' | jq -r '.[0].files[] | select(.os == "linux" and .arch == "amd64" and .kind == "archive") | .filename')
URL="https://go.dev/dl/$TAR_FILENAME"
curl -fsSL "$URL" -o /tmp/go.tar.gz
sudo tar -C /usr/local -xzf /tmp/go.tar.gz
if [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi
rm -f /tmp/go.tar.gz

# golangci-lint
# Linter ists: https://golangci-lint.run/usage/linters/
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

# Go Tools for VSCode
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/gopls@latest
go install github.com/josharian/impl@latest
