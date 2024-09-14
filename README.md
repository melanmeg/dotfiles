# dotfiles

## Procedure

- Ubuntu 24.04 AMD x64

```bash
git clone https://github.com/melanmeg/dotfiles.git
./dotfiles/.bin/dotfiles --backup --gitconfig-shared
```

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global credential.helper store
```

```bash
$ ./dotfiles -h
Rust CLI for Dotfiles.

Usage: dotfiles [OPTIONS]

Options:
  -f, --force             Force overwrite
  -b, --backup            Backup dotfiles
  -l, --link              Link to homedir
  -g, --gitconfig-shared  git config (.gitconfig_shared)
  -h, --help              Print help
  -V, --version           Print version
```

- font(0xProto): https://github.com/0xType/0xProto/blob/main/fonts/0xProto-Regular.ttf
