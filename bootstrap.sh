#!/bin/bash
set -e

# init dir
mkdir -p ~/.vim/bundle
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim

# neobundle install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
