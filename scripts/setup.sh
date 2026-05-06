#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH_DIR/custom}"

log() {
  printf '\n==> %s\n' "$1"
}

warn() {
  printf 'warning: %s\n' "$1" >&2
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

clone_if_missing() {
  local repo="$1"
  local target="$2"

  if ! command_exists git; then
    warn "git is required to clone $repo"
    return 1
  fi

  if [[ -d "$target/.git" ]]; then
    printf 'Already installed: %s\n' "$target"
    return
  fi

  if [[ -e "$target" ]]; then
    warn "skipping $target because it already exists and is not a git checkout"
    return
  fi

  git clone "$repo" "$target"
}

install_oh_my_zsh() {
  log "Installing oh-my-zsh"

  if [[ -d "$ZSH_DIR" ]]; then
    printf 'Already installed: %s\n' "$ZSH_DIR"
    return
  fi

  if command_exists wget; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
      "$(wget -O - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  elif command_exists curl; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
      "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    warn "install wget or curl, then rerun this script to install oh-my-zsh"
    return 1
  fi
}

install_zsh_plugins() {
  log "Installing zsh plugins"

  mkdir -p "$ZSH_CUSTOM/plugins"
  clone_if_missing \
    https://github.com/zsh-users/zsh-autosuggestions.git \
    "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  clone_if_missing \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
}

install_zsh_config() {
  log "Installing zsh config"
  cp "$REPO_ROOT/dotfiles/.zshrc" "$HOME/.zshrc"
}

install_fzf() {
  log "Installing fzf"

  if command_exists fzf; then
    printf 'Already installed: %s\n' "$(command -v fzf)"
    return
  fi

  if command_exists brew; then
    brew install fzf
    return
  fi

  clone_if_missing https://github.com/junegunn/fzf.git "$HOME/.fzf"

  if [[ -x "$HOME/.fzf/install" ]]; then
    "$HOME/.fzf/install" --bin --key-bindings --completion --no-update-rc
  else
    warn "fzf install script was not found at $HOME/.fzf/install"
    return 1
  fi
}

install_vim() {
  log "Installing vim config"

  mkdir -p "$HOME/.vim/bundle"
  clone_if_missing \
    https://github.com/VundleVim/Vundle.vim.git \
    "$HOME/.vim/bundle/Vundle.vim"

  cp "$REPO_ROOT/dotfiles/.vimrc" "$HOME/.vimrc"

  if command_exists vim; then
    vim +PluginInstall +qall
  else
    warn "vim is not installed; copied .vimrc but skipped PluginInstall"
  fi
}

install_tmux() {
  log "Installing tmux config"
  cp "$REPO_ROOT"/dotfiles/.tmux.* "$HOME"/
}

usage() {
  cat <<'EOF'
Usage: bash scripts/setup.sh [all|zsh|zsh-init|zsh-plugins|fzf|vim|tmux]

Without an argument, runs the full setup:
  zsh -> zsh plugins -> fzf -> vim -> tmux
EOF
}

main() {
  local target="${1:-all}"

  case "$target" in
    all)
      install_oh_my_zsh
      install_zsh_plugins
      install_fzf
      install_zsh_config
      install_vim
      install_tmux
      ;;
    zsh)
      install_oh_my_zsh
      install_zsh_plugins
      install_fzf
      install_zsh_config
      ;;
    zsh-init)
      install_oh_my_zsh
      install_zsh_config
      ;;
    zsh-plugins)
      install_zsh_plugins
      install_zsh_config
      ;;
    fzf)
      install_fzf
      install_zsh_config
      ;;
    vim)
      install_vim
      ;;
    tmux)
      install_tmux
      ;;
    -h|--help|help)
      usage
      return
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac

  case "$target" in
    all|zsh|zsh-init|zsh-plugins|fzf)
      printf '\nDone. Restart your shell or run: exec zsh\n'
      ;;
    *)
      printf '\nDone.\n'
      ;;
  esac
}

main "$@"
