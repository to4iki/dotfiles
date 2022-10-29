## path
set -x PATH /opt/homebrew/bin $PATH
set -x GOPATH $HOME
set -x RBENV_ROOT $HOME/.rbenv/
set -x PATH $HOME/src/github.com/to4iki/dotfiles/bin $PATH

## setting
set -x EDITOR vim
set -x LANG ja_JP.UTF-8

## alias
alias l 'ls -la'
alias v 'vim'
alias g 'git'
alias s 'git s'
alias b 'git br'
alias m 'git co master'
alias d 'git d'
alias t 'tig'

## key binding
function fish_user_key_bindings
    bind \co __fzf_open --editor
    bind \cr __fzf_reverse_isearch
    bind \c] __ghq_repository_search
    bind \cb __fzf_select_branch
end

## option
function fzf
    command fzf --height 30% --reverse --border $argv
end
