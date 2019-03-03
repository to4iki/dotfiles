## PATH
# git
set -gx PATH /usr/local/share/git-core/contrib/diff-highlight $PATH
# Go
set -gx GOPATH $HOME
# rbenv
set -gx RBENV_ROOT $HOME/.rbenv/
# z
set -gx Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh
# NeoVim
set -gx XDG_CONFIG_HOME $HOME/.config
# Local scripts
set -gx PATH $HOME/src/github.com/to4iki/dotfiles/bin $PATH

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
alias b 'git br'
alias m 'git co master'
alias d 'git d'
alias gg 'git g'
alias t 'tig'
alias ta 'tig --all'
alias be 'bundle exec'
alias run 'cmdshelf run'

## KEY_BINDINGS
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \c] peco_select_ghq_repository
end

## OPTIONS
function peco
    command peco --layout=bottom-up $argv
end
