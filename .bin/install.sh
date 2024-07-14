#!/bin/bash -ue

helpmsg() {
  echo "Usage: $0 [--help | -h]" >&2
  echo ""
}

clear_dotfiles() {
  echo "clear dotfiles..."
  rm -f ~/.*
}

backup_dotfiles() {
  echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ]; then
    echo "$HOME/.dotbackup not found. Auto Make it"
    mkdir "$HOME/.dotbackup"
  fi
}

link_to_homedir() {
  local script_dir
  local dotdir

  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  dotdir=$(dirname "${script_dir}")

  if [[ "$HOME" != "$dotdir" ]]; then
    for f in "$dotdir"/.??*; do
      [[ $(basename "$f") == ".git" ]] && continue
      if [[ -L "$HOME/$(basename "$f")" ]]; then
        rm -f "$HOME/$(basename "$f")"
      fi
      if [[ -e "$HOME/$(basename "$f")" ]]; then
        mv "$HOME/$(basename "$f")" "$HOME/.dotbackup"
      fi
      if [[ "$1" -ne 0 ]]; then
        ln -snf "$f" "$HOME"
      fi
    done
  else
    echo "same install src dest"
  fi
}

install_handler() {
  if [[ "$1" -ne 0 ]]; then
    clear_dotfiles
  fi
  if [[ "$2" -ne 0 ]]; then
    backup_dotfiles
  fi
  link_to_homedir "$3"
}

main() {
  local clear_flag=0
  local backup_flag=0
  local link_flag=0

  while [ $# -gt 0 ]; do
    case ${1} in
    --help | -h)
      helpmsg
      exit 1
      ;;
    --debug | -d)
      set -uex
      ;;
    --clear | -c)
      clear_flag=1
      ;;
    --backup | -b)
      backup_flag=1
      ;;
    --link | -l)
      link_flag=1
      ;;
    *) ;;
    esac
    shift
  done

  link_to_homedir $clear_flag $backup_flag $link_flag
  git config --global include.path "$HOME/.gitconfig_shared"
  echo -e "\e[1;36m Install completed!!!! \e[m"
}

main "$@"
