#!/usr/bin/env bash
# Installs or updates the clean-prose plugin under ~/.gemini/config/plugins (Linux, macOS, WSL).
set -euo pipefail
REPO="https://github.com/isjati/clean-prose.git"
DEST="$HOME/.gemini/config/plugins/clean-prose"

if [ -d "$DEST/.git" ]; then
  git -C "$DEST" pull --ff-only && echo "Updated $DEST"
else
  mkdir -p "$(dirname "$DEST")"
  git clone "$REPO" "$DEST" && echo "Installed to $DEST"
fi
echo "Start a new agent conversation to load the plugin."
