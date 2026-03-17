#!/bin/bash
set -euo pipefail

export DOTFILES="$(cd "$(dirname "$0")" && pwd)"
export CONFIGS="$DOTFILES/configs"

SCRIPTS="$DOTFILES/scripts"
TARGETS="$SCRIPTS/targets"

source "$SCRIPTS/lib.sh"
source "$SCRIPTS/brew.sh"

main() {
  echo ""
  cat <<'EOF'
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

    _ .-') _                .-') _                                  ('-.    .-')    
    ( (  OO) )              (  OO) )                               _(  OO)  ( OO ).  
     \     .'_  .-'),-----. /     '._    ,------.,-.-')  ,--.     (,------.(_)---\_) 
     ,`'--..._)( OO'  .-.  '|'--...__)('-| _.---'|  |OO) |  |.-')  |  .---'/    _ |  
     |  |  \  '/   |  | |  |'--.  .--'(OO|(_\    |  |  \ |  | OO ) |  |    \  :` `.  
     |  |   ' |\_) |  |\|  |   |  |   /  |  '--. |  |(_/ |  |`-' |(|  '--.  '..`''.) 
     |  |   / :  \ |  | |  |   |  |   \_)|  .--',|  |_.'(|  '---.' |  .--' .-._)   \ 
     |  '--'  /   `'  '-'  '   |  |     \|  |_)(_|  |    |      |  |  `---.\       / 
     `-------'      `-----'    `--'      `--'    `--'    `------'  `------' `-----'

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
EOF
  echo ""
  echo ""

  ensure_brew
  echo ""

  # Setup all files in targets/
  for f in "$TARGETS"/*.sh; do
    [[ -f "$f" ]] || continue
    source "$f"
    local func="setup_$(basename "$f" .sh)"
    log_info "Execute '$func'"
    if declare -f "$func" &>/dev/null; then
      "$func"
    else
      log_warn "$(basename "$f"): setup function '$func' not found, skipped"
    fi
    echo ""
  done

  log_success "All done!"
}

main "$@"
