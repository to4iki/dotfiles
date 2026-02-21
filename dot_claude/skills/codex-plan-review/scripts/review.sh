#!/bin/bash
set -euo pipefail

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Plan file path and state (initial/updated) are required." >&2
  echo "Usage: $0 <path_to_plan> <initial|updated>" >&2
  exit 1
fi

PLAN_FILE="$1"
STATE="$2"
PROMPT_FILE="$(dirname "$0")/../assets/review_prompt.md"

if [ ! -f "$PLAN_FILE" ]; then
  echo "Error: Plan file not found: $PLAN_FILE" >&2
  exit 1
fi

if [ "$STATE" = "initial" ]; then
  cat "$PROMPT_FILE" "$PLAN_FILE" | codex exec --full-auto --sandbox read-only -
elif [ "$STATE" = "updated" ]; then
  echo -e "The plan has been updated. Please review it again.\n" | \
    cat - "$PROMPT_FILE" "$PLAN_FILE" | codex exec resume --last --full-auto --sandbox read-only -
else
  echo "Error: State must be 'initial' or 'updated'." >&2
  exit 1
fi
