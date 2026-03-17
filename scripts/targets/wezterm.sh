#!/bin/bash

setup_wezterm() {
  brew_cask_install wezterm
  safe_link "$CONFIGS/wezterm" "$HOME/.config/wezterm"
}
