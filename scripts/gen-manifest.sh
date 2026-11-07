#!/usr/bin/env bash
# videos/, images/ 안의 파일 목록으로 manifest.json 생성
set -euo pipefail
cd "$(dirname "$0")/.."

list() {
  local dir="$1"; shift
  local first=1
  while IFS= read -r f; do
    [ $first -eq 1 ] && first=0 || printf ','
    printf '\n    "%s"' "$f"
  done < <(find "$dir" -type f \( "$@" \) | sort)
}

{
  printf '{\n  "videos": ['
  list videos -iname '*.mp4' -o -iname '*.webm' -o -iname '*.mov'
  printf '\n  ],\n  "images": ['
  list images -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif'
  printf '\n  ]\n}\n'
} > manifest.json

echo "manifest.json updated"
