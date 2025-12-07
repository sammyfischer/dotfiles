#!/bin/bash

# 1. View this file on github
# 2. Click the "raw" button and copy the url
# 3. curl -L <the url>
# 4. Place this script whever you want and run it

git clone --bare git@github.com:sammyfischer/dotfiles.git "$HOME/.dotfiles"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
dot checkout origin/main
dot config status.showUntrackedFiles no
dot branch -u origin/main main

# download git prompt script
curl -o "$HOME/scripts/git-prompt.sh" -L https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh

# download git bash completion script
curl -o "$HOME/scripts/git-completion.bash" -L https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-completion.bash

source "$HOME/.bashrc"
