#!/bin/zsh

set -e

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

# Install homebrew 🍺
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ~/.zshrc

# Install brew formulaes and casks ⏳
brew install volta
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

# Install volta toolchains ⚡️
volta install node
volta install commitizen

source ~/.zshrc
# All done ✅
