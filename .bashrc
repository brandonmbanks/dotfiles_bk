test -f ~/.git-completion.bash && . $_

git_current_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null 
}

git_status() {
 if [ -n "$(git status --porcelain)" ]; then echo "*"; fi 2>/dev/null
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PS1="\e[33m\w\e[m\e[32m \$(git_current_branch)\\e[m \$(git_status)\\n$ "

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

