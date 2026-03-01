#!/bin/bash

CONFIGS="$HOME/dotfiles/configs"

# nvim
mkdir -p "$HOME/.config"
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi
ln -sf "$CONFIGS/nvim" "$HOME/.config/nvim"
