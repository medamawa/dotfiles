#!/bin/bash

setup_powerlevel10k() {
  brew_install powerlevel10k
  safe_link "$CONFIGS/powerlevel10k/.p10k.zsh" "$HOME/.p10k.zsh"
}

