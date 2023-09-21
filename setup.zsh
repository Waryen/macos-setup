#!/bin/zsh

set -e

# Install Oh-my-zsh 💻
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew 🍺
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew formulas and casks 🍺
brew install docker \
  bun \
  git
brew install --cask visual-studio-code \
  1password \
  raycast \
  discord \
  warp \
  rectangle \
  spotify \
  raycast \
  firefox

# Install Volta ⚡️
curl https://get.volta.sh | bash

# Install toolchains ⚡️
volta install node@18 \
  commitizen \
  npm-check-updates \
  vercel \
  npkill \
  nodemon \
  create-expo-app \
  depcheck \
  eas \
  expo \
  json-server \
  nx \
  turbo

# Set global Git config
git config --global user.name "Waryen"
git config --global user.email "jonathangomand@gmail.com"

# Source zshrc at the end
source ~/.zshrc

# All done ✅
