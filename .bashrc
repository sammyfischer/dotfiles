if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"

source ~/scripts/git-completion.bash
source ~/scripts/git-prompt.sh

color_pink="\e[35m"
color_blue="\e[34m"
color_cyan="\e[36m"
color_gray="\e[90m"
color_green="\e[32m"
color_reset="\e[0m"

update_prompt() {
  local git_branch
  git_branch=$(__git_ps1 "%s")
  local git_prompt=""
  if [[ -n $git_branch ]]; then
    git_prompt=" ${color_green} ${git_branch}"
  fi

  PS1="${color_gray}[${color_pink} \u ${color_cyan} \W${git_prompt}${color_gray}]${color_reset} "
}
PROMPT_COMMAND=update_prompt

# aliases
alias c="clear"
alias ls="ls --color=auto"
alias grep="grep --color"

# xclip aliases
alias clipin="xclip -selection c" # copy from stdin
alias clipout="xclip -selection c -o" # paste to stdout

# dotfiles aliases
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias dots="dot status"
alias dotadd="dot add -u ; dots"
alias dotpatch="dot add -p ; dots"
alias dotfetch="dot fetch -tpP --all"

# git aliases
alias st="git status"
alias patch="git add -p && git status"
alias commit="git commit -m"
alias branch="git branch -vv"
alias fetch="git fetch -tpP --all"
alias clean="fetch ; ~/scripts/git-branch-clean.py"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
