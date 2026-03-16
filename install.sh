#!/bin/bash

CONFIGS="$HOME/dotfiles/configs"

# brew


# vim
ln -sf "$CONFIGS/vim/.vimrc" "$HOME/.vimrc"
echo "linked: vim config"

# nvim
# $ brew install neovim
mkdir -p "$HOME/.config"
if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
fi
ln -sf "$CONFIGS/nvim" "$HOME/.config/nvim"
echo "linked: nvim config"

# wezterm
# $ brew install --cask wezterm
if [ -e "$HOME/.config/wezterm" ] && [ ! -L "$HOME/.config/wezterm" ]; then
  mv "$HOME/.config/wezterm" "$HOME/.config/wezterm.bak"
fi
ln -sf "$CONFIGS/wezterm" "$HOME/.config/wezterm"
echo "linked: wezterm config"

# tmux
# $ brew install tmux
ln -sf "$CONFIGS/tmux/.tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.config/tmux"
ln -sf "$CONFIGS/tmux/plugins" "$HOME/.config/tmux/plugins"
echo "linked: tmux config"
