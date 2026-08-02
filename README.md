# Business Development Meeting Intelligence — Batch Kit

This kit contains the skill plus a script to run it over a whole folder of
meeting notes at once, using the Claude Code CLI.

## What's in here

- `business-development-meeting-intelligence/SKILL.md` — the skill itself.
- `install_skill.sh` — one-time setup: copies the skill into `~/.claude/skills/`.
- `batch_bd_memos.sh` — the batch runner.

## Requirements

- [Claude Code](https://docs.claude.com/en/docs/claude-code) installed and
  logged in. Check with `claude --version` in a terminal.

## Quick start

1. Unzip this kit somewhere on your machine and open a terminal there.
2. Make the scripts runnable (one time):
   ```bash
   chmod +x install_skill.sh batch_bd_memos.sh
   ```
3. Install the skill:
   ```bash
   ./install_skill.sh
   ```
4. Put your meeting-notes files (`.docx`, `.txt`, or `.md`) in a folder, e.g.
   `./meeting-notes/`. One file can contain notes for several meetings — the
   skill will split them into separate memos automatically.
5. Run the batch script:
   ```bash
   ./batch_bd_memos.sh ./meeting-notes ./memos
   ```
6. Check the `./memos` folder — one `_followup_memo.md` file per input file,
   plus a `.log` file per input for troubleshooting if anything fails.

## Updating the skill later

If you want to tweak the skill's rules or memo format, edit
`business-development-meeting-intelligence/SKILL.md` in this kit, then rerun
`./install_skill.sh` to push the update to `~/.claude/skills/`.

## Notes

- The batch script uses `--dangerously-skip-permissions` so it can run
  unattended without pausing for approval on each file read/write/search.
  That flag just skips Claude Code's interactive confirmation prompts — it
  doesn't change what the skill is allowed to do (reading the input files,
  writing the output memo, and web searches for market research). Only run
  this against files and folders you're comfortable automating.
- If a run fails, the corresponding `.log` file in the output folder has the
  full transcript of what Claude Code did — that's the first place to look.
- CLI flag names occasionally change between Claude Code versions. If
  `batch_bd_memos.sh` errors immediately on an unrecognized flag, run
  `claude --help` and swap in the current equivalents.
