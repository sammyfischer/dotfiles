#!/bin/bash

# 1. View this file on github
# 2. Click the "raw" button and copy the url
# 3. curl -L <the url>
# 4. Place this script whever you want and run it

git clone --bare git@github.com:sammyfischer/dotfiles.git $HOME/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

dot checkout
dot config status.showUntrackedFiles no
source ~/.bashrc

