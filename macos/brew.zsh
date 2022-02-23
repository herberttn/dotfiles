#!/usr/bin/env zsh

sudo -v

if which brew &> /dev/null; then
  echo brew: already installed
else
  echo brew: installing
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo brew: regenerating brewfile lock
rm -rfv $(dirname ${0:A})/brewfile.lock.json

echo brew: installing formulae/casks from the brewfile
brew bundle --file=brewfile

echo brew: uninstalling formulae/casks not in the brewfile
brew bundle --file=brewfile --cleanup

echo brew: uninstalling bad formulae/casks
# All casks and formulas here should be kept in sync with brewfile and the list in apps.md
brew uninstall awscli
brew uninstall bluejeans
brew uninstall cheatsheet
brew uninstall dropzone
brew uninstall hex-fiend
brew uninstall maccy
brew uninstall mockuuups-studio

echo brew: removing unused dependencies
brew autoremove
