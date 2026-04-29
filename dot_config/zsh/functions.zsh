# Navigate to project roots within ghq-managed repositories
ghq_roots() {
  local selected=$(ghq list --full-path | roots | fzf --query "$LBUFFER")
  if [ -n "$selected" ]; then
    BUFFER="cd $selected"
    zle accept-line
  fi
  zle reset-prompt
}

# Navigate to git worktrees
wt() {
  git wt $(git wt | tail -n +2 | fzf | awk '{print $(NF-1)}')
}
