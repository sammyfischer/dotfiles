#!/bin/bash

# 1. Run git clone --bare git@github.com:sammyfischer/dotfiles.git "$HOME/.dotfiles"
# 2. Run "$HOME/scripts/dotfiles-setup.sh"

alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dot checkout main
dot config status.showUntrackedFiles no
dot branch -u origin/main main

# download git prompt script
curl -o "$HOME/scripts/git-prompt.sh" -L https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh

# download git bash completion script
curl -o "$HOME/scripts/git-completion.bash" -L https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash

source "$HOME/.bashrc"
