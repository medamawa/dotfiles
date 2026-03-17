#!/bin/bash

setup_exports() {
  safe_link "$CONFIGS/exports/.exports" "$HOME/.exports"

  append_if_missing -p "$HOME/.zshrc" "source ~/.exports"
  append_if_missing -p "$HOME/.zshrc" "# Personal exports"
}
