## PATH
# Homebrew
set -x PATH /opt/homebrew/bin:/usr/local/bin $PATH
# Android
set -x PATH $HOME//Library/Android/sdk/platform-tools $PATH
# Go
set -x GOPATH $HOME
# rbenv
set -x RBENV_ROOT $HOME/.rbenv/
# Local scripts
set -x PATH $HOME/src/github.com/to4iki/dotfiles/bin $PATH

## EDITOR
set -x EDITOR vim

## LANGUAGE
set -x LANG ja_JP.UTF-8

## ALIAS
alias l 'ls -la'
alias v 'vim'
alias g 'git'
alias s 'git s'
alias b 'git br'
alias m 'git co master'
alias d 'git d'
alias t 'tig'

## KEY_BINDINGS
function fish_user_key_bindings
    bind \co __fzf_open --editor
    bind \cr __fzf_reverse_isearch
    bind \c] __ghq_repository_search
    bind \cb __fzf_select_branch
end

## OPTIONS
function fzf
    command fzf --height 30% --reverse --border $argv
end
