# ghq with fzf integration
fzf_ghq() {
  local selected=$(ghq list | fzf --query "$LBUFFER")
  if [ -n "$selected" ]; then
    BUFFER="cd $(ghq root)/$selected"
    zle accept-line
  fi
  zle reset-prompt
}

# fzf git branch switcher
fzf_branch() {
  local branches=$(git branch --all | grep -v HEAD | sed 's/^[* ] //' | sed 's#^remotes/origin/##')
  local selected=$(echo "$branches" | sort -u | fzf --query "$LBUFFER")
  if [ -n "$selected" ]; then
    BUFFER="git switch $selected"
    zle accept-line
  fi
  zle reset-prompt
}

# fzf git diff between two commits
fzf_difit() {
  local from_commit to_commit from_hash to_hash

  from_commit=$(git log --oneline --decorate -100 --color=always | \
    fzf \
      --ansi \
      --header "> difit \$TO \$FROM~1" \
      --prompt "Select \$FROM>" \
      --preview 'git log --oneline --decorate --color=always -1 {1}' \
      --preview-window=top:3:wrap
  ) || return
  from_hash="${from_commit%% *}"

  to_commit=$(git log --oneline --decorate -100 --color=always $from_hash~1.. | \
    fzf \
      --ansi \
      --header "> difit \$TO $from_hash~1" \
      --prompt "Select \$TO>" \
      --preview 'git log --oneline --decorate --color=always -1 {1}' \
      --preview-window=top:3:wrap
  ) || return
  to_hash="${to_commit%% *}"

  difit "$to_hash" "$from_hash~1"
}

# git-wt with fzf integration
wt() {
  git wt $(git wt | tail -n +2 | fzf | awk '{print $(NF-1)}')
}
