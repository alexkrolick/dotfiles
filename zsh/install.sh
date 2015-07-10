#!/bin/sh

# Ensure homebrew
if [ ! $(which brew) ]; then
  source $(dirname -- "$0")/../homebrew/install.sh
fi

# Move to Homebrew's version of ZSH
if [ ! $(which zsh | grep '/usr/local') ]; then
  brew install zsh zsh-completions zsh-syntax-highlighting zsh-lovers
fi

if [ ! $(which vcprompt) ]; then
  brew install --HEAD vcprompt > /tmp/vcprompt-install.log
fi

if [ ! $(which exa) ]; then
  echo "  Installing exa for you."
  brew cask install exa > /tmp/exa-install.log
fi
