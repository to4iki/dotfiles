cd ~/

# init dir
mkdir -p ~/dotfiles/.lib
mkdir -p ~/.vim/bundle

# init ~/dotfiles/.lib/
cd ~/dotfiles/.lib
curl -O https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh

# neobundle install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
