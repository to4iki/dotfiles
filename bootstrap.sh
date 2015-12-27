#!/bin/bash
set -e

# init dir
mkdir ~/.config
mkdir -p ~/.vim/bundle

# neobundle install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
