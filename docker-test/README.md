### Docker test

```bash
cargo build

docker-compose build --build-arg CACHEBURST=$(date +%s) \
docker-compose up -d \
docker-compose exec dot bash

rm -f ~/dotfiles/.bin/dotfiles && cp -a /target/debug/dotfiles ~/dotfiles/.bin/ \
~/dotfiles/.bin/dotfiles -h
```

```bash
# zsh setup
sh ~/dotfiles/.bin/scripts/zsh_setup.sh
docker-compose exec dot zsh
```
