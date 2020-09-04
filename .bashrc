export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

# default editor
EDITOR='vim'

# history settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

# append to history
shopt -s histappend

# source aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

CLICOLOR=1
LSCOLORS=GxFxCxDxBxegedabagaced

git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

git_dirty() {
  if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
    echo -e "*"
  fi
}

RED="\[\033[1;31m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
CLEAR="\[\033[00m\]"

git_prompt() {
    # First, get the branch name...
    local branch=$(git_branch)
    # Empty output? Then we're not in a Git repository, so bypass the rest
    # of the function, producing no output
    if [[ -n $branch ]]; then
       echo -e "$branch \033[1;31m$(git_dirty)"
    fi
}

export PS1="$YELLOW\w$GREEN \$(git_prompt)\n$CLEAR$ "

export REQUESTS_CA_BUNDLE=~/.cert-bundle.pem

