#!/usr/bin/env bash
# Compares the vendored humanizer catalogue with upstream and reports the other
# two sources' latest commits, so you can decide whether to re-sync.
# Usage: scripts/check-upstream.sh [--apply]   (--apply rewrites references/patterns.md)
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL="$ROOT/skills/clean-prose/references/patterns.md"
tmp="$(mktemp)"; trap 'rm -f "$tmp" "$tmp.body"' EXIT

curl -fsSL https://raw.githubusercontent.com/blader/humanizer/HEAD/SKILL.md -o "$tmp"
version="$(grep -m1 -E '^\s*version:' "$tmp" | tr -d ' "' | cut -d: -f2)"
awk 'BEGIN{f=0} /^---$/{f++; next} f>=2' "$tmp" > "$tmp.body"

if diff -q <(sed '1,/^-->$/d' "$LOCAL" | sed '1{/^$/d}') "$tmp.body" >/dev/null; then
  echo "humanizer: up to date (upstream v$version)"
else
  echo "humanizer: upstream changed (v$version)"
  if [ "${1:-}" = "--apply" ]; then
    {
      printf '%s\n' '<!--' "Source: https://github.com/blader/humanizer (SKILL.md, v$version)" \
        'Copyright (c) 2025 Siqi Chen. MIT License. See THIRD_PARTY_NOTICES.md.' \
        'Included verbatim below the frontmatter. Refresh with scripts/check-upstream.sh.' \
        'House rules in ../SKILL.md override this file where they differ (em dashes in long documents).' \
        '-->' ''
      cat "$tmp.body"
    } > "$LOCAL"
    echo "  rewrote $LOCAL; review the diff, then bump CHANGELOG.md"
  else
    echo "  run with --apply to update references/patterns.md"
  fi
fi

for r in hardikpandya/stop-slop petergyang/no-ai-slop; do
  pushed="$(curl -fsSL "https://api.github.com/repos/$r" | grep -m1 '"pushed_at"' | cut -d'"' -f4)"
  echo "$r: last push $pushed (adapted by hand; compare with references/)"
done
