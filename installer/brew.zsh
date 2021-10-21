#!/usr/bin/env zsh

source $(dirname ${0:A})/brew-casks.zsh
source $(dirname ${0:A})/brew-formulae.zsh

sudo -v

if which brew &> /dev/null; then
  echo brew: already installed
else
  echo brew: installing
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo
echo brew: updating
brew update

echo
echo brew: checking outdated casks
brew outdated --cask --greedy --verbose

echo
echo brew: checking outdated formulae
brew outdated --formula --greedy --verbose

echo
echo brew: upgrading casks already installed
brew upgrade --cask $casks

echo
echo brew: upgrading formulae already installed
brew upgrade --formula $formulae

echo
echo brew: installing missing casks
brew install --cask $casks

echo
echo brew: installing missing formulae
brew install --formula $formulae
