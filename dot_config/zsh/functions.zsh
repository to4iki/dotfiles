# ghq with fzf integration
fzf_ghq() {
  local selected=$(ghq list | fzf --query "$LBUFFER")
  if [ -n "$selected" ]; then
    BUFFER="cd $(ghq root)/$selected"
    zle accept-line
  fi
  zle reset-prompt
}

# git-wt with fzf integration
wt() {
  git wt $(git wt | tail -n +2 | fzf | awk '{print $(NF-1)}')
}
