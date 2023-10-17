#!/bin/bash

# CLI binaries via homebrew
binaries=(
  nvm
  diskonaut
  graphicsmagick
  webkit2png
  bash-completion
  openssl
  boost
  ca-certificates
  mysql
  rename
  jq
  zopfli
  ffmpeg
  python
  sshfs
  trash
  tree
  ack
  hub
  git
  tig
  wget
  fasd
  peco
)
# Apps via homebrew cask
apps=(
  google-chrome
  dbeaver-community
  spotify
  orbstack
  iterm2
  visual-studio-code
  quicklook-json
  slack
  sourcetree
  mongodb-compass
  whatsapp
  sketch
  microsoft-excel
  microsoft-teams
  microsoft-outlook
  microsoft-word
  1password
)

# fonts to install through cask
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-source-code-pro
)

# Global NPM packages
packages=(
  yarn
  pnpm
)

vscodeExtensions=(
  Asuka.insertnumbers
  bmewburn.vscode-intelephense-client
  cjhowe7.laravel-blade
  dbaeumer.vscode-eslint
  ecmel.vscode-html-css
  eriklynd.json-tools
  esbenp.prettier-vscode
  fabianlauer.vs-code-xml-format
  fabiospampinato.vscode-diff
  gerane.Theme-TomorrowNightEighties
  GitHub.copilot
  GitHub.copilot-chat
  mohsen1.prettify-json
  redhat.vscode-xml
  ryu1kn.partial-diff
  shufo.vscode-blade-formatter
  sidthesloth.html5-boilerplate
  streetsidesoftware.code-spell-checker
  Tyriar.lorem-ipsum
  unifiedjs.vscode-mdx
)

# install homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# update homebrew and install super-dependencies
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

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew install caskroom/cask/brew-cask

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

brew tap caskroom/fonts

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# setup git
git config --global push.default simple
git config --global user.email "barry@therhodes.co.uk"

# install node
nvm install node
npm install -g ${packages[@]}

# install vscode extensions
code --install-extension --force ${fonts[@]}

mkdir ~/tmp
wget "https://gist.githubusercontent.com/brandonb927/3195465/raw/d20ab577180f93da4d9bbea1ddf2a67809c8f69d/osx-for-hackers.sh"
echo "Downloaded OSX for hackers into ~/tmp/osx-for-hackers.sh. Give it a read through, edit and run it..."
