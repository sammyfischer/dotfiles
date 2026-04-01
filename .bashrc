if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export PATH="$PATH:$HOME/.local/bin:$HOME/scripts"
export VISUAL="nvim"
export EDITOR="nvim"

. ~/scripts/git-completion.bash
. ~/scripts/git-prompt.sh

update_prompt() {
  local reset="\e[0m"
  local black="\e[30m"
  local red="\e[31m"
  local green="\e[32m"
  local yellow="\e[33m"
  local blue="\e[34m"
  local pink="\e[35m"
  local cyan="\e[36m"
  local white="\e[37m"
  local gray="\e[90m"

  local git_branch=$(__git_ps1 "%s")
  local git_prompt=""
  if [[ -n $git_branch ]]; then
    git_prompt=" ${green} ${git_branch}"
  fi

  PS1="${reset}${cyan} \w${git_prompt} ${gray}󰄾${reset} "
  PS2="${reset} ${gray}󰘍${reset} "
  PS3="${reset} ${gray}󰄾${reset} "
}
# limit dir in prompt to show last 2 parts of path
PROMPT_DIRTRIM=2
PROMPT_COMMAND=update_prompt

# aliases
alias c="clear"

# program defaults/shortcuts
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias rip="rg -S --crlf"
alias clip="xclip -selection clipboard"

alias ez="eza \
  -a \
  --git-ignore \
  --icons=always \
  --color-scale=all \
  --color-scale-mode=gradient \
  --level=5 \
  --binary \
  --group \
  --header \
  --git"
alias ezt="ez -T"
alias ezl="ez -l"

alias fz="fzf \
  --style=full \
  --scroll-off=3 \
  --prompt='󰄾 ' \
  --pointer=' ' \
  --marker='󰄾' \
  --preview='bat --color=always --style=numbers --line-range=:50 {}'"
alias fzp="fz --scheme=path"
alias fzh="fz --scheme=history"
eval "$(fzf --bash)"

# dotfiles aliases
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias dots="dot status"
alias dotadd="dot add -u ; dots"
alias dotpatch="dot add -p ; dots"
alias dotc="dot commit -m"
alias dotfetch="dot fetch -tp --all"
alias dotls="dot ls-files | fzp"

# git aliases
alias st="git status"
alias patch="git add -p ; git status"
alias commit="git commit -m"
alias branch="git branch -vv"
alias fetch="git fetch -tp --all"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
