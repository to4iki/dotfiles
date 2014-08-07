# Make sure using latest Homebrew
update || true

# Update already-installed formula
upgrade || true

# Add Repository
tap homebrew/versions    || true
tap phinze/homebrew-cask || true
tap homebrew/binary      || true
tap thoughtbot/formulae  || true

# Packages

## shell
install zsh || true
install zsh-completions || true
install z || true

## Editor
install vim || true

## Git
install git || true
install gibo || true
install hub || true
install tig || true
install git-now || true

## Utils
install ag || true
install markdown || true
install reattach-to-user-namespace || true
install readline || true
install tmux || true
install wget || true

## Languages
install rbenv || true
install ruby-build || true
install go || true
install python || true

## DevOps
install docker      || true
install boot2docker || true

## Heroku
install heroku-toolbelt || true

## Casks
install brew-cask
cask install alfred || true
cask install appcleaner || true
cask install bettertouchtool || true
cask install caffeine || true
cask install clipmenu || true
cask install dropbox || true
cask install dash || true
cask install google-chrome-canary || true
cask install iterm2 || true
cask install keyremap4macbook || true
cask install hipchat || true
cask install kobito || true
cask install pckeyboardhack || true
cask install spark || true
cask install sourcetree || true
cask install virtualbox || true
cask install vagrant || true

cask alfred link

# Remove outdated versions
cleanup
