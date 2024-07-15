# dotfiles

## Procedure

- Ubuntu

```bash
git clone https://github.com/melanmeg/dotfiles.git
./dotfiles/.bin/rust_install -b
sh ~/dotfiles/.bin/zsh_setup.sh
```

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global credential.helper store
```

```bash
ln -snf .zsh/aliases/* .bash/aliases/ && ln -snf .bash/aliases/* .zsh/aliases/
ls -l .zsh/aliases/ && ls -l .bash/aliases/
```
