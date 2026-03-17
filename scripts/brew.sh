#!/bin/bash

ensure_brew() {
  if command -v brew &>/dev/null; then
    log_info "Homebrew already installed."
    return
  fi

  log_info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  log_success "Homebrew installed."
}

brew_install() {
  local pkg="$1"

  if brew list --formula "$pkg" &>/dev/null; then
    log_info "'$pkg' already installed."
  else
    log_info "Installing '$pkg'..."
    brew install "$pkg"
    log_success "'$pkg' installed."
  fi
}

brew_cask_install() {
  local pkg="$1"

  if brew list --cask "$pkg" &>/dev/null; then
    log_info "'$pkg (cask)' already installed."
  else
    log_info "Installing '$pkg (cask)'..."
    brew install --cask "$pkg"
    log_success "'$pkg (cask)' installed."
  fi
}

