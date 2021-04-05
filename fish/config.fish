## PATH
# Android
set -x PATH $HOME//Library/Android/sdk/platform-tools $PATH
# Go
set -x GOPATH $HOME
# rbenv
set -x RBENV_ROOT $HOME/.rbenv/
# z
set -x Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
# NeoVim
set -x XDG_CONFIG_HOME $HOME/.config
# Local scripts
set -x PATH $HOME/src/github.com/to4iki/dotfiles/bin $PATH

## EDITOR
set -x EDITOR vim

## LANGUAGE
set -x LANG ja_JP.UTF-8

## ALIAS
alias l 'ls -la'
alias vim 'nvim'
alias vi 'vim'
alias v 'vim'
alias o 'open'
alias git 'hub'
alias g 'git'
alias s 'git s'
alias b 'git br'
alias m 'git co master'
alias d 'git d'
alias t 'tig'

## KEY_BINDINGS
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \c] peco_select_ghq_repository
    bind \cb peco_select_branch
end

## OPTIONS
function peco
    command peco --layout=bottom-up $argv
end
