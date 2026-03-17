#!/bin/bash

setup_nvim() {
  brew_install neovim
  safe_link "$CONFIGS/nvim" "$HOME/.config/nvim"
}
