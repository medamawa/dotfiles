#!/bin/bash

setup_wezterm() {
  brew_cask_install wezterm
  safe_link "$CONFIGS/wezterm" "$HOME/.config/wezterm"

  append_if_missing -p "$HOME/.zshrc" "fi # = End: Load WezTerm-specific configuration ================="
  append_if_missing -p "$HOME/.zshrc" "  [[ -f ~/.config/wezterm/.zshrc.wezterm ]] && source ~/.config/wezterm/.zshrc.wezterm"
  append_if_missing -p "$HOME/.zshrc" 'if [[ -n "$WEZTERM" ]]; then'
  append_if_missing -p "$HOME/.zshrc" "# ==== Load WezTerm-specific configuration ======================"
}
