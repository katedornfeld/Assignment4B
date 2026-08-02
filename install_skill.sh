#!/usr/bin/env bash
# install_skill.sh
#
# Installs the "Business Development Meeting Intelligence" skill into your
# personal Claude Code skills folder (~/.claude/skills/) so it's available
# automatically in every project, without needing to save it through the app.
#
# Usage:
#   ./install_skill.sh
#
# Run this from the folder where you unzipped the kit (the one that contains
# the business-development-meeting-intelligence/ subfolder).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/business-development-meeting-intelligence"
SKILL_DEST="$HOME/.claude/skills/business-development-meeting-intelligence"

if [[ ! -d "$SKILL_SRC" ]]; then
  echo "Couldn't find $SKILL_SRC"
  echo "Run this script from the folder where you unzipped the kit."
  exit 1
fi

mkdir -p "$HOME/.claude/skills"

if [[ -d "$SKILL_DEST" ]]; then
  echo "A skill is already installed at $SKILL_DEST — overwriting with this version."
  rm -rf "$SKILL_DEST"
fi

cp -r "$SKILL_SRC" "$SKILL_DEST"

echo "Installed skill to: $SKILL_DEST"
echo
echo "To confirm it's available, open Claude Code in any project and run:"
echo "  claude"
echo "  /skills"
echo "You should see 'business-development-meeting-intelligence' in the list."
