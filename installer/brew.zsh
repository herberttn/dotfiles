#!/usr/bin/env zsh

sudo -v

if which brew &> /dev/null; then
  echo brew: already installed
else
  echo brew: installing
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo brew: bundle
brew bundle
