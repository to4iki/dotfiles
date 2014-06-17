cd ~/

# init dir
mkdir -p ~/dotfiles/.lib
mkdir -p ~/.vim/bundle

# init ~/dotfiles/.lib/
cd ~/dotfiles/.lib
git clone git@github.com:zsh-users/zaw.git
curl -O https://gist.github.com/syui/7112389/raw/growl.zsh
curl -O https://raw.githubusercontent.com/Tarrasch/zsh-bd/master/bd.zsh

# nodebrew
curl -L git.io/nodebrew | perl - setup

# neobundle install
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
