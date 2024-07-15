# Develop

## Rust

```bash
# pre-setting
cargo new develop && cd develop
cargo add clap --features derive

# simple run
cargo run -q -- -h

# building exe run
cargo build --release
./target/debug/rust_install -h
```

## Docker test

```bash
docker-compose build
docker-compose up -d
docker-compose exec dot bash
rm -f ~/dotfiles/.bin/rust_install && cp -a /target/debug/rust_install ~/dotfiles/.bin/
~/dotfiles/.bin/rust_install -h

# zsh setup
sh ~/dotfiles/.bin/zsh_setup.sh
docker-compose exec dot zsh
```

## Copy binary

```bash
cp -a ./target/debug/rust_install ../.bin/
```
