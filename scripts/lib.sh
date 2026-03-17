#!/bin/bash

# ------------------------------------------------- #
# log_* (msg)                                       #
#                                                   #
# Logging Helper.                                   #
# ------------------------------------------------- #

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

log_info() {
  echo "${CYAN}[INFO]${NC} $1"
}

log_success() {
  echo "${GREEN}[OK]${NC}   $1"
}

log_warn() {
  echo "${YELLOW}[WARN]${NC} $1"
}

log_error() {
  echo "${RED}[ERR]${NC}  $1"
}

# ------------------------------------------------- #
# backup_id_needed <target>                         #
#                                                   #
# If the target exists and is NOT a symlink,        #
# move it to a `.bak` file to avoid data loss.      #
# ------------------------------------------------- #
backup_if_needed() {
  local target="$1"

  # Backup when target exists
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "${target}.bak"
    log_warn "Backup: [ $target ] -> [ ${target}.bak ]"
  fi
}

# ------------------------------------------------- #
# safe_link <src> <dst>                             #
#                                                   #
# Safely create a symbolic link.                    #
# ------------------------------------------------- #
safe_link() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"

  # Remove if symlink exists
  if [[ -L "$dst" ]]; then
    rm "$dst"
    log_warn "Symlink [ $dst ] removed."
  else
    backup_if_needed "$dst"
  fi

  ln -s "$src" "$dst"
  log_success "Linked: [ $src ] -> [ $dst ]"
}

# ------------------------------------------------- #
# append_if_missing [-p, f] <file> <line>           #
#                                                   #
# Append a line to a file it it doesn't exist yet.  #
# Use -p to prepend to the beginning instead        #
# Use -f to skip the duplicate check (force)        #
# ------------------------------------------------- #
append_if_missing() {
  local prepend=false
  local force=false
  while [[ "${1:-}" == -* ]]; do
    local flags="${1#-}"
    shift
    while [[ -n "$flags" ]]; do
      case "${flags:0:1}" in
      p) prepend=true ;;
      f) force=true ;;
      *)
        log_error "Unknown flag: -${flags:0:1}"
        return 1
        ;;
      esac
      flags="${flags:1}"
    done
  done

  local file="$1"
  local line="$2"

  if [[ ! -f "$file" ]]; then
    log_error "File not found: $file"
    return 1
  fi

  if ! "$force" && grep -qxF "$line" "$file"; then
    log_info "Already in [ $file ]: $line"
    return
  fi

  if "$prepend"; then
    local tmp
    tmp=$(mktemp)
    printf "%s\n" "$line" | cat - "$file" >"$tmp"
    mv "$tmp" "$file"
    log_success "Prepended to [ $file ]: $line"
  else
    echo "$line" >>"$file"
    log_success "Appended to [ $file ]: $line"
  fi
}
