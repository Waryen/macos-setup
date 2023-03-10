#!/bin/zsh

# FIXME script stoping qfter installing Oh-my-zsh

set -e

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

# Install homebrew 🍺
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

# Install Volta
curl https://get.volta.sh | bash
source ~/.zshrc

# Install brew formulaes and casks ⏳
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask 1password
brew install --cask raycast
brew install --cask discord
brew install --cask warp
brew install --cask rectangle
brew install --cask spotify
source ~/.zshrc

# Install volta toolchains and others ⚡️
volta install node
volta install commitizen
volta install cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc
source ~/.zshrc

# Set Git config
git config --global user.name "Waryen"
git config --global user.email "jonathangomand@gmail.com"

source ~/.zshrc
# All done ✅
