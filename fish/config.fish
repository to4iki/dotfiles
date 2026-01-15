## path
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/src/github.com/to4iki/dotfiles/bin $PATH
set -gx GOPATH $HOME

## setting
set -gx EDITOR vim
set -gx LANG ja_JP.UTF-8

## alias
alias l 'ls -la'
alias v 'vim'
alias g 'git'
alias s 'git s'
alias b 'git br'
alias m 'git sw master'
alias d 'git d'
alias t 'tig'

## key binding
function fish_user_key_bindings
  bind \co __fzf_open
  bind \cr __fzf_reverse_isearch
  bind \c] __ghq_repository_search
  bind \cb __fzf_select_branch
end

## option
function fzf
  command fzf --height 30% --reverse --border $argv
end
