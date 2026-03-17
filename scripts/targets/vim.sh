#!/bin/bash

setup_vim() {
  safe_link "$CONFIGS/vim/.vimrc" "$HOME/.vimrc"
}
