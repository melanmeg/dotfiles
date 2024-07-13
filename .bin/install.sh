#!/bin/bash -eux

helpmsg() {
  echo "Usage: $0 [--help | -h]" >&2
  echo ""
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

  backup_dotfiles

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
      ln -snf "$f" "$HOME"
    done
  else
    echo "same install src dest"
  fi
}

main() {
  while [ $# -gt 0 ]; do
    case ${1} in
    --debug | -d)
      set -uex
      ;;
    --help | -h)
      helpmsg
      exit 1
      ;;
    *) ;;

    esac
    shift
  done

  link_to_homedir
  git config --global include.path "$HOME/.gitconfig_shared"
  echo -e "\e[1;36m Install completed!!!! \e[m"
}

main "$@"
