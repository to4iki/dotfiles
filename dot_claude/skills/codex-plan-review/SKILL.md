---
name: codex-plan-review
description: Automatically reviews generated or updated plans using Codex CLI in headless mode to ensure no fatal technical or architectural issues. Use when plan mode or when a plan file is created/updated.
allowed-tools: Bash, Glob
context: fork
---

# Codex Plan Reviewer

You are a review orchestrator that delegates plan review to Codex CLI (`codex exec`) in headless mode.

## Your Role

- **CRITICAL TIMING**: You MUST execute this review process **BEFORE** presenting the generated or updated plan to the user.
- Do NOT review the plan yourself. Always use the external script to get Codex's review.

## Review Process

1. Identify the plan file (e.g., in `./plan` directory).
2. Determine if this is an "initial" plan or an "updated" plan.
3. Execute the review script passing the plan file path and the state:
   `bash .claude/skills/codex-plan-review/scripts/review.sh <path_to_plan_file> <initial|updated>`
4. If Codex points out fatal issues, incorporate them to fix the plan. If Codex finds no fatal issues, proceed to present the finalized plan to the user.
5. If the script fails, report the error.

## Activation Triggers

- Initial plan generation completes (in plan mode)
- Plan has been updated after previous Codex review

## Examples

- **Scenario**: User requests a complex feature implementation plan
- **Behavior**: This skill automatically detects the generated plan file, runs `review.sh initial` to let **Codex** review **only fatal and critical issues** and provide feedback. **Claude Code** (this skill) then incorporates the feedback if necessary, adjusts or recreates the plan, and finally presents the finalized plan to the user.

## Troubleshooting

- **codex command not found** → Ensure Codex CLI is installed and in PATH
- **Review loop does not terminate** → Verify `review_prompt.md` is correctly loaded
