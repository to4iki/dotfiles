## path
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/src/github.com/to4iki/dotfiles/bin $PATH
set -gx GOPATH $HOME
set -gx VOLTA_HOME $HOME/.volta
set -gx PATH $VOLTA_HOME/bin $PATH

# rbenv
status --is-interactive; and source (rbenv init -|psub)
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# ffmpeg
set -x PATH $HOME/src $PATH

# Firebase
# set -x FIREBASE_TOKEN your_token_here

# GCloud SDK
set -gx PATH $HOME/google-cloud-sdk/bin $PATH

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
  bind \co __fzf_open --editor
  bind \cr __fzf_reverse_isearch
  bind \c] __ghq_repository_search
  bind \cb __fzf_select_branch
end

## option
function fzf
  command fzf --height 30% --reverse --border $argv
end

# Google AI Platform
set -gx GOOGLE_GENAI_USE_VERTEXAI true
set -gx GOOGLE_CLOUD_PROJECT mirrativ-dev
set -gx GOOGLE_CLOUD_LOCATION global

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/to4iki/google-cloud-sdk/path.fish.inc' ]; . '/Users/to4iki/google-cloud-sdk/path.fish.inc'; end
