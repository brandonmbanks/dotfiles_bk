export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH

export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export EDITOR='vim'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

git_dirty() {
  if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
    echo -e "x"
  fi
}

git_prompt() {
    # First, get the branch name...
    local branch=$(git_branch)
    # Empty output? Then we're not in a Git repository, so bypass the rest
    # of the function, producing no output
    if [[ -n $branch ]]; then
       echo -e "\x01\x02$branch\x01\033[00m\x02"  # last bit resets color
    fi
}

export PS1="\e[33m\w\e[m\e[32m \$(git_prompt)\\e[m\n$ "
export REQUESTS_CA_BUNDLE=~/.cert-bundle.pem

