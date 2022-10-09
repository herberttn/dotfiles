# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export COLOR=true
export FORCE_COLOR=true

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

export NVM_AUTO_USE=true
export NVM_COMPLETION=true
export NVM_NO_USE=true
export NVM_SYMLINK_CURRENT=true
antigen bundle lukechilds/zsh-nvm

# Tell Antigen that you're done.
antigen apply

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# nvm
nvm use stable

alias gc='git reset HEAD --hard && git clean -fd && git pull'
alias gs='git status'

local __filename=~/.zshrc
local __filename=${__filename:A}
local __dirname=$(dirname $__filename)

for file in $(find $__dirname/private -type f -name '*.zsh'); do
  source $file
done

export GH_TOKEN=$privateGitHubToken
export GITHUB_TOKEN=$privateGitHubToken

function gcc {
  git fetch --force --tags
  git fetch --prune --prune-tags

  for branch in $(gccList); do
    git branch --delete --force $branch;
  done
}

function gccList {
  git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'
}

function nlwr {
  npm run clean
  npx lerna clean -y
  rm -rf package-lock.json
  rm -rf node_modules
  npm i
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
