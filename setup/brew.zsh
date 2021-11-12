#!/usr/bin/env zsh

sudo -v

if which brew &> /dev/null; then
  echo brew: already installed
else
  echo brew: installing
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo brew: regenerating brewfile lock
rm -rfv $(dirname ${0:A})/../Brewfile.lock.json

echo brew: installing formulae/casks from the brewfile
brew bundle

echo brew: uninstalling formulae/casks not in the brewfile
brew bundle cleanup --force

echo brew: uninstalling bad formulae/casks
brew uninstall cheatsheet # due to whole system performance hangs and memory usage

echo brew: removing unused dependencies
brew autoremove
