# PATH settings
typeset -U path  # Remove duplicates

path=(
  /opt/homebrew/bin
  $HOME/.local/bin
  $path
)

export PATH
