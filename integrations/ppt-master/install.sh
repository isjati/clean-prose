#!/usr/bin/env bash
# Installs the clean-prose hook into a local ppt-master checkout.
# Usage: integrations/ppt-master/install.sh [/path/to/ppt-master]
#
# Writes (or refreshes) a marked block in <ppt-master>/GEMINI.md and adds GEMINI.md
# to .git/info/exclude so upstream `git pull` stays clean. Nothing under
# skills/ppt-master/ is modified.
set -euo pipefail

TARGET="${1:-$HOME/projects/ppt-master}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK="$HERE/GEMINI.md"
DEST="$TARGET/GEMINI.md"
BEGIN='<!-- clean-prose:ppt-master-hook:begin -->'
END='<!-- clean-prose:ppt-master-hook:end -->'

[ -d "$TARGET/skills/ppt-master" ] || { echo "Not a ppt-master checkout: $TARGET" >&2; exit 1; }

if [ -f "$DEST" ] && grep -qF "$BEGIN" "$DEST"; then
  # Replace the existing block, keep anything else in the file.
  tmp="$(mktemp)"
  awk -v b="$BEGIN" -v e="$END" -v hook="$HOOK" '
    $0==b {while ((getline line < hook) > 0) print line; skip=1; next}
    $0==e {skip=0; next}
    !skip {print}
  ' "$DEST" > "$tmp"
  mv "$tmp" "$DEST"
  echo "Refreshed hook block in $DEST"
elif [ -f "$DEST" ]; then
  printf '\n' >> "$DEST"
  cat "$HOOK" >> "$DEST"
  echo "Appended hook block to $DEST"
else
  cp "$HOOK" "$DEST"
  echo "Created $DEST"
fi

EXCLUDE="$TARGET/.git/info/exclude"
if [ -d "$TARGET/.git" ] && ! grep -qxF 'GEMINI.md' "$EXCLUDE" 2>/dev/null; then
  echo 'GEMINI.md' >> "$EXCLUDE"
  echo "Added GEMINI.md to $EXCLUDE"
fi
