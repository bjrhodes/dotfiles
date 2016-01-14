#!/bin/bash

# install homebrew

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update

brew update;

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  graphicsmagick
  webkit2png
  bash-completion
  rename
  zopfli
  ffmpeg
  python
  sshfs
  trash
  node
  nvm
  tree
  ack
  hub
  git
  wget
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew install caskroom/cask/brew-cask

# Apps
apps=(
  dropbox
  google-chrome
  google-drive
  transmit
  firefox
  spotify
  vagrant
  iterm2
  sublime-text
  virtualbox
  quicklook-json
  skype
  java
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew tap caskroom/fonts

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-source-code-pro
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# setup git
git config --global push.default simple
git config --global user.email "barry@mymedialab.co.uk"

mkdir ~/tmp
wget "https://gist.githubusercontent.com/brandonb927/3195465/raw/d20ab577180f93da4d9bbea1ddf2a67809c8f69d/osx-for-hackers.sh"
echo "Downloaded OSX for hackers into ~/tmp/osx-for-hackers.sh. Give it a read through, edit and run it..."
