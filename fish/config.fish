# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
# set -gx OMF_CONFIG $HOME/.config/omf

## PATH
## homebrew-cask
set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications --caskroom=$HOME/Caskroom"
# node.js
set -gx PATH $HOME/.nodebrew/current/bin $PATH
# Go
set -gx GOPATH $HOME
# rbenv
set -gx RBENV_ROOT $HOME/.rbenv/
# z
set -gx Z_SCRIPT_PATH (brew --prefix)/etc/profile.d/z.sh

## EDITOR
set -U EDITOR vim

## LANGUAGE
set -x LANG ja_JP.UTF-8

## ALIAS
alias l 'ls -la'
alias vi 'vim'
alias v 'vim'
alias git 'hub'
alias g 'git'
alias s 'git s'
alias m 'git checkout master'
alias d 'git d'
alias t 'tig'
alias ta 'tig --all'
alias be 'bundle exec'
alias r 'repo'

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

## KEY_BINDINGS
function fish_user_key_bindings
    bind \cr peco_select_history
    bind \c] peco_select_ghq_repository
end

## OPTIONS
function peco
    command peco --layout=bottom-up $argv
end
