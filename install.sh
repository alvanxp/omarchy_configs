#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

link_file() {
  local source="$1"
  local target="$2"
  mkdir -p "$(dirname -- "$target")"
  if [[ -e "$target" || -L "$target" ]]; then
    if [[ "$(readlink -f -- "$target" 2>/dev/null || true)" == "$(readlink -f -- "$source")" ]]; then
      return
    fi
    mv -- "$target" "${target}.backup.$(date +%Y%m%d%H%M%S)"
  fi
  ln -s -- "$source" "$target"
}

while IFS= read -r -d '' source; do
  relative="${source#"$repo_dir/"}"
  case "$relative" in
    nvim/*) target="$config_dir/${relative#nvim/}";;
    *) target="$config_dir/$relative";;
  esac
  link_file "$source" "$target"
done < <(find "$repo_dir" -type f \
  ! -path "$repo_dir/.git/*" \
  ! -name 'README.md' \
  ! -name 'install.sh' \
  ! -path "$repo_dir/git/config.example" \
  -print0)

echo "Configuration linked from $repo_dir"
echo "Review hypr/monitors.lua for machine-specific display settings."
