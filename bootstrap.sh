#!/bin/bash
set -e

# init dir
mkdir ~/.config
mkdir -p ~/.vim/bundle

# neobundle install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# oh-my-zsh-theme install
if [[ ! -f ~/.oh-my-zsh/themes/t4.zsh-theme ]]; then
    info "Install oh-my-zsh-theme"
    curl -fsSL https://raw.github.com/to4iki/oh-my-zsh-t4-theme/master/t4.zsh-theme >> ~/.oh-my-zsh/themes/t4.zsh-theme
fi
