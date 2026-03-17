#!/bin/bash

setup_fzf() {
  brew_install fzf

  append_if_missing "$HOME/.zshrc" "# Set up fzf key bindings and fuzzy completion"
  append_if_missing "$HOME/.zshrc" "source <(fzf --zsh)"
}


