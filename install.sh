#!/bin/bash

CONFIGS="$HOME/dotfiles/configs"

# vim
ln -sf "$CONFIGS/vim/vimrc" "$HOME/.vimrc"
echo "linked: vim config"

# nvim
mkdir -p "$HOME/.config"
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi
ln -sf "$CONFIGS/nvim" "$HOME/.config/nvim"
echo "linked: nvim config"

# wezterm
if [ -e "$HOME/.config/wezterm" ] && [ ! -L "$HOME/.config/wezterm" ]; then
  mv "$HOME/.config/wezterm" "$HOME/.config/wezterm.bak"
fi
ln -sf "$CONFIGS/wezterm" "$HOME/.config/wezterm"
echo "linked: wezterm config"
