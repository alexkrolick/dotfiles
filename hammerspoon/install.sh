#!/bin/sh

# Ensure homebrew
if [ ! $(which brew) ]; then
  source $(dirname -- "$0")/../homebrew/install.sh
fi

if [ $(brew cask ls --versions hammerspoon > /dev/null 2>&1) ]; then
  echo "  Installing hammerspoon for you, this may require your password."
  brew cask install hammerspoon > /tmp/hammerspoon-install.log
fi
