## PATH
# git
set -gx PATH /usr/local/share/git-core/contrib/diff-highlight $PATH
# node.js
set -gx PATH $HOME/.nodebrew/current/bin $PATH
# Go
set -gx GOPATH $HOME
# rbenv
set -gx RBENV_ROOT $HOME/.rbenv/
# z
set -gx Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
# NeoVim
set -gx XDG_CONFIG_HOME $HOME/.config

## EDITOR
set -U EDITOR vim

## LANGUAGE
set -x LANG ja_JP.UTF-8

## ALIAS
alias l 'ls -la'
alias vim 'nvim'
alias vi 'vim'
alias v 'vim'
alias git 'hub'
alias g 'git'
alias s 'git s'
alias m 'git checkout master'
alias d 'git d'
alias gg 'git g'
alias t 'tig'
alias ta 'tig --all'
alias be 'bundle exec'

## KEY_BINDINGS
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \c] peco_select_ghq_repository
    bind \cx\cr peco_recentd
    bind \cx\cb peco_select_branch
end

## OPTIONS
function peco
    command peco --layout=bottom-up $argv
end
