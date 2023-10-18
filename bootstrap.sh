#!/bin/bash

# @todo make the cmd-shift-l work on install!

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
  trash
  tree
  ack
  hub
  git
  tig
  wget
  peco
)

# Apps via homebrew cask
apps=(
  google-chrome
  dbeaver-community
  # spotify
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
  font-mplus
  font-clear-sans
  font-roboto
  font-source-code-pro
)

# Global NPM packages
packages=(
  yarn
  pnpm
)

# install homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# update homebrew and install super-dependencies
brew update;

# Install GNU core utilities (those that come with OS X are outdated)
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed, grep, Bash 4
brew install coreutils findutils bash grep

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew install homebrew/cask/brew-cask

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew install --cask --appdir="/Applications" ${apps[@]}

brew tap homebrew/cask-fonts

# install fonts
echo "installing fonts..."
brew install --cask ${fonts[@]}

# setup git
git config --global push.default simple
git config --global user.email "barry@therhodes.co.uk"

# install node
nvm install node
npm install -g ${packages[@]}

# install vscode extensions
code --install-extension Asuka.insertnumbers --force
code --install-extension bmewburn.vscode-intelephense-client --force
code --install-extension cjhowe7.laravel-blade --force
code --install-extension dbaeumer.vscode-eslint --force
code --install-extension ecmel.vscode-html-css --force
code --install-extension eriklynd.json-tools --force
code --install-extension esbenp.prettier-vscode --force
code --install-extension fabianlauer.vs-code-xml-format --force
code --install-extension fabiospampinato.vscode-diff --force
code --install-extension gerane.Theme-TomorrowNightEighties --force
code --install-extension GitHub.copilot --force
code --install-extension GitHub.copilot-chat --force
code --install-extension mohsen1.prettify-json --force
code --install-extension redhat.vscode-xml --force
code --install-extension ryu1kn.partial-diff --force
code --install-extension shufo.vscode-blade-formatter --force
code --install-extension sidthesloth.html5-boilerplate --force
code --install-extension streetsidesoftware.code-spell-checker --force
code --install-extension Tyriar.lorem-ipsum --force
code --install-extension unifiedjs.vscode-mdx --force

# Copy VSCode settings
cp keybindings.json ~/Library/Application Support/Code/User/
cp settings.json ~/Library/Application Support/Code/User/

mkdir ~/tmp
cd ~/tmp
wget "https://gist.githubusercontent.com/brandonb927/3195465/raw/d20ab577180f93da4d9bbea1ddf2a67809c8f69d/osx-for-hackers.sh"
echo "Downloaded OSX for hackers into ~/tmp/osx-for-hackers.sh. Give it a read through, edit and run it..."
