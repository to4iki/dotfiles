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

# git-wt with fzf integration
wt() {
  git wt $(git wt | tail -n +2 | fzf | awk '{print $(NF-1)}')
}
