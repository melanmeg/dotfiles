# dotfiles

## Procedure

- Ubuntu

```bash
git clone https://github.com/melanmeg/dotfiles.git
./dotfiles/.bin/dotfiles --backup
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
  -f, --force    Force overwrite
  -b, --backup   Backup dotfiles
  -l, --link     Link to homedir
  -h, --help     Print help
  -V, --version  Print version
```
