#!/bin/sh

set -e

# Install homebrew 🍺
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew formulaes and casks ⏳
brew install volta
brew install bun
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask 1password
brew install --cask raycast
brew install --cask discord
brew install --cask warp
brew install --cask rectangle
brew install --cask spotify
brew install --cask readdle-spark
brew install --cask deepl
source ~/.zshrc

# Install volta toolchains ⚡️
volta install node
volta install yarn
volta install pnpm
volta install commitizen
volta install vercel
volta install expo-cli

# All done ✅
