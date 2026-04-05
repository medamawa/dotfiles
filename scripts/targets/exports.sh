#!/bin/bash

# TODO: Add .exports.local for the local exports
setup_exports() {
  safe_link "$CONFIGS/exports/.exports" "$HOME/.exports"

  append_if_missing -p "$HOME/.zshrc" "source ~/.exports"
  append_if_missing -p "$HOME/.zshrc" "# Personal exports"
}
