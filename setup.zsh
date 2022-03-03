#!/usr/bin/env zsh

sudo -v
local __dirname=$(dirname ${0:A})

zsh macos/brew.zsh
zsh macos/defaults.zsh

ln -s $__dirname/user/.gitconfig ~/.gitconfig
ln -s $__dirname/user/.zshrc ~/.zshrc
