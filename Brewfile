# Make sure using latest Homebrew
update || true

# Update already-installed formula
upgrade || true

# Add Repository
tap homebrew/versions || true
tap phinze/homebrew-cask || true
tap homebrew/binary || true
tap thoughtbot/formulae || true
tap peco/peco || true
tap motemen/ghq || true

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
install reattach-to-user-namespace || true
install readline || true
install tmux || true
install peco || true
install ghq || true

## Languages
install rbenv || true
install ruby-build || true
install go || true
install nodebrew || true
install carthage || true

## Heroku
install heroku-toolbelt || true

## Casks
install brew-cask
cask install appcleaner || true
case install atom || true
cask install bettertouchtool || true
cask install clipmenu || true
cask install dropbox || true
cask install iterm2 || true
cask install Karabiner || true
cask install pckeyboardhack || true
cask install spark || true
cask install sourcetree || true
cask install virtualbox || true
cask install vagrant || true

# Remove outdated versions
cleanup
