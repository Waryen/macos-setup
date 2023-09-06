#!/bin/zsh

set -e

# Install Oh-my-zsh 💻
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew 🍺
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew formulas and casks 🍺
brew install mas
brew install git
brew tap oven-sh/bun
brew install bun
brew install docker
brew install cocoapods
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask 1password
brew install --cask raycast
brew install --cask discord
brew install --cask warp
brew install --cask rectangle
brew install --cask spotify
brew install --cask telegram
brew install --cask raycast

# Install Volta ⚡️
curl https://get.volta.sh | bash

# Install toolchains ⚡️
volta install node@18
volta install commitizen
volta install npm-check-updates
volta install vercel
volta install npkill
volta install nodemon
volta install create-expo-app
volta install depcheck
volta install eas
volta install expo
volta install json-server
volta install nx
volta install turbo

# Set global Git config
git config --global user.name "Waryen"
git config --global user.email "jonathangomand@gmail.com"

# Install Xcode from the Mac App Store
mas install 497799835  # Xcode (this requires the 'mas' command-line tool, available on the Mac App Store)

# Source zshrc at the end
source ~/.zshrc

# All done ✅
