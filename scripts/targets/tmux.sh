#!/bin/bash

setup_tmux() {
  brew_install tmux
  safe_link "$CONFIGS/tmux/.tmux.conf" "$HOME/.tmux.conf"
  
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
  log_warn "Plugins are not installed. Press <prefix> + I (Shift + i) in tmux."
}
