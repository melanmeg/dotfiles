#!/bin/bash
set -eux

sudo rm -rf /usr/local/go
TAR_FILENAME=$(curl 'https://go.dev/dl/?mode=json' | jq -r '.[0].files[] | select(.os == "linux" and .arch == "amd64" and .kind == "archive") | .filename')
URL="https://go.dev/dl/$TAR_FILENAME"
curl -fsSL "$URL" -o /tmp/go.tar.gz
sudo tar -C /usr/local -xzf /tmp/go.tar.gz
if [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi
rm -f /tmp/go.tar.gz