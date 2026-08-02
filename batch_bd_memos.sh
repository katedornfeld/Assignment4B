#!/usr/bin/env bash
# batch_bd_memos.sh
#
# Batch-runs the "Business Development Meeting Intelligence" Claude Code skill
# over a whole folder of meeting-note files, producing one follow-up-memo
# markdown file per input file (a file can contain notes for more than one
# meeting — the skill will produce one memo per meeting inside that output).
#
# Requirements:
#   - Claude Code CLI installed and logged in. Check with: claude --version
#   - The skill installed first — run ./install_skill.sh once (see that script).
#
# Usage:
#   ./batch_bd_memos.sh <input_folder> [output_folder]
#
# Example:
#   ./batch_bd_memos.sh ./meeting-notes ./memos
#
# Accepts .docx, .txt, and .md files in the input folder (not subfolders).
#
# Note on flags: --allowedTools and --dangerously-skip-permissions are current
# as of mid-2026 Claude Code CLI releases. If this errors on your version, run
# `claude --help` and swap in whatever the equivalent flags are called now.

set -euo pipefail

INPUT_DIR="${1:-}"
OUTPUT_DIR="${2:-./memos}"

if [[ -z "$INPUT_DIR" ]]; then
  echo "Usage: $0 <input_folder> [output_folder]"
  exit 1
fi

if [[ ! -d "$INPUT_DIR" ]]; then
  echo "Input folder not found: $INPUT_DIR"
  exit 1
fi

if ! command -v claude >/dev/null 2>&1; then
  echo "Couldn't find the 'claude' command. Install Claude Code and log in first:"
  echo "  https://docs.claude.com/en/docs/claude-code"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

shopt -s nullglob
FILES=("$INPUT_DIR"/*.docx "$INPUT_DIR"/*.txt "$INPUT_DIR"/*.md)
shopt -u nullglob

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No .docx, .txt, or .md files found directly inside $INPUT_DIR"
  exit 1
fi

echo "Found ${#FILES[@]} file(s) to process."
echo "Output folder: $OUTPUT_DIR"
echo

SUCCESS_COUNT=0
FAIL_COUNT=0

for FILE in "${FILES[@]}"; do
  BASENAME="$(basename "$FILE")"
  NAME_NO_EXT="${BASENAME%.*}"
  OUT_FILE="$OUTPUT_DIR/${NAME_NO_EXT}_followup_memo.md"
  LOG_FILE="$OUTPUT_DIR/${NAME_NO_EXT}.log"

  echo "Processing: $BASENAME"

  PROMPT="Use the business-development-meeting-intelligence skill to turn the meeting notes in the file \"$FILE\" into a follow-up memo. If the file contains notes for more than one meeting, produce one complete memo per meeting, in the order they appear, inside a single output document. Follow the skill's rules exactly: apply Judgment Call #1 (next step, owner, timeline — mark anything not clearly stated as 'Requires Human Review' rather than guessing) and Judgment Call #2 (only include market research that is directly tied to something raised in that specific meeting; if none qualifies, say so explicitly). Never invent deadlines, owners, agreements, market facts, or customer intentions. Write the final memo(s) as markdown to the file \"$OUT_FILE\"."

  if claude -p "$PROMPT" \
      --allowedTools "Read,Write,WebSearch,WebFetch" \
      --dangerously-skip-permissions \
      > "$LOG_FILE" 2>&1; then
    if [[ -f "$OUT_FILE" ]]; then
      echo "  -> $OUT_FILE"
      SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
      echo "  !! Command finished but no output file was created — check $LOG_FILE"
      FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
  else
    echo "  !! Claude Code returned an error — check $LOG_FILE"
    FAIL_COUNT=$((FAIL_COUNT + 1))
  fi
  echo
done

echo "Done: $SUCCESS_COUNT memo(s) written, $FAIL_COUNT failed."
echo "Memos are in: $OUTPUT_DIR"
if [[ $FAIL_COUNT -gt 0 ]]; then
  echo "Check the .log files in that folder for anything that failed."
fi
