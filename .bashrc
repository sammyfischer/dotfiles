if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"
export VISUAL="nvim"
export EDITOR="nvim"

source ~/scripts/git-completion.bash
source ~/scripts/git-prompt.sh

update_prompt() {
  local pink="\e[35m"
  local blue="\e[34m"
  local cyan="\e[36m"
  local gray="\e[90m"
  local green="\e[32m"
  local reset="\e[0m"

  local git_branch=$(__git_ps1 "%s")
  local git_prompt=""
  if [[ -n $git_branch ]]; then
    git_prompt=" ${green} ${git_branch}"
  fi

  PS1="${reset}${cyan} \W${git_prompt} ${gray}${reset} "
}
PROMPT_COMMAND=update_prompt

# aliases
alias c="clear"

# xclip aliases
alias clipin="xclip -selection clipboard -in" # copy from stdin
alias clipout="xclip -selection clipboard -out" # paste to stdout

# eza defaults
eza_flags="-a --git-ignore --icons=always --color-scale=all --color-scale-mode=gradient"
alias ez="eza $eza_flags"
# eza tree display defaults
alias ezt="eza $eza_flags -T --level=5"
# eza long listing defaults
alias ezl="eza $eza_flags -l --binary --group --header --git"

# use ripgrep instead of grep
alias grep="rg -S --crlf"

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
