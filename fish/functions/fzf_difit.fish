function fzf_difit -d "Select FROM and TO git commits with fzf and display diff using difit"
  set -l from_commit (git log --oneline --decorate -100 --color=always | \
    fzf \
      --ansi \
      --header "> difit \$TO \$FROM~1" \
      --prompt "Select \$FROM>" \
      --preview 'git log --oneline --decorate --color=always -1 {1}' \
      --preview-window=top:3:wrap
  )
  or return

  set -l from_hash (string split ' ' $from_commit)[1]

  set -l to_commit (git log --oneline --decorate -100 --color=always "$from_hash~1.." | \
    fzf \
      --ansi \
      --header "> difit \$TO $from_hash~1" \
      --prompt "Select \$TO>" \
      --preview 'git log --oneline --decorate --color=always -1 {1}' \
      --preview-window=top:3:wrap
  )
  or return

  set -l to_hash (string split ' ' $to_commit)[1]

  difit "$to_hash" "$from_hash~1"
end
