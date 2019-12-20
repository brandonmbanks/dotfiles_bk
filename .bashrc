git_current_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null 
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PS1="\e[33m\w\e[m\e[32m \$(git_current_branch)\\e[m\n$ "

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

