if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

GIT_UTILITIES=~/GitHub/rkiel/git-utilities
source ${GIT_UTILITIES}/dotfiles/bashrc

NODE_UTILITIES=~/GitHub/rkiel/node-utilities
source ${NODE_UTILITIES}/dotfiles/bashrc

PATH="$HOME/scripts:$PATH"
PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:/opt/homebrew/Cellar/neovim/0.11.1/bin/nvim"
export PATH

# custom prompt
source ~/.git-prompt.sh

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

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

# git aliases
alias st="git status"
alias patch="git add -p && git status"
alias unstage="git restore --staged && git status"
alias commit="git commit -m"
alias fetch="git fetch -tpP --all"
alias branch="git branch -vv"
alias clean="fetch && git-branch-clean.py"

# disable telemetry for aws sam
export SAM_CLI_TELEMETRY=0
