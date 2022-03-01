#!/usr/bin/env zsh

sudo -v
local here=$(dirname ${0:A})

zsh macos/brew.zsh
zsh macos/defaults.zsh

ln -s $here/user/.gitconfig ~/.gitconfig
ln -s $here/user/.zshrc ~/.zshrc
