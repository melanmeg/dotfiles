# Develop

## Rust

```bash
# pre-setting
cargo new develop && cd develop
cargo add clap --features derive

# simple run
cargo run -q -- -h

# building exe run
cargo build
./target/debug/rust_install -h
```

- Release

```bash
# 古いglibでも動くように配布する
rustup target add x86_64-unknown-linux-musl
cargo build --release --target=x86_64-unknown-linux-musl
```

## Docker test

```bash
docker-compose build --build-arg CACHEBUST=$(date +%s)
docker-compose up -d
docker-compose exec dot bash
rm -f ~/dotfiles/.bin/rust_install && cp -a /target/debug/rust_install ~/dotfiles/.bin/
~/dotfiles/.bin/rust_install -h

# zsh setup
sh ~/dotfiles/.bin/scripts/zsh_setup.sh
docker-compose exec dot zsh
```

## Swich binary

```bash
rm -f ../.bin/rust_install && cp -a ./target/release/rust_install ../.bin/
```
