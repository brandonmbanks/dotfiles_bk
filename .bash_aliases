# general
alias c="clear"
alias lsa="ls -al"

alias python="python3"

mkcd() {
  mkdir -p -- "$1" && cd -P "$1"
}

# git
gd() {
    git diff --color=always "$@" | less -r
}
alias gfo="git fetch origin"
alias gco="git checkout"
#__git_complete gco _git_checkout
alias gcom="git checkout main"
alias gcb="git checkout -b"
alias glr="git pull --rebase"
alias gpo="git push origin"
alias gss="git status -s"
alias ga.="git add . -u"
# add tracked files and commit with passed message
gcaa() {
    git add . -u
    git commit -m "$@"
}

git_branch() {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

alias cb="git rev-parse --abbrev-ref HEAD"
alias gbdl="git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D"
alias gpush='git push origin "$(git_branch)"'
alias gpull='git pull origin "$(git_branch)"'
alias gcmsg='git commit -m'

# php
alias cda="composer dump-autoload"
alias punit="./vendor/bin/phpunit"
alias mrs="php artisan migrate:refresh --seed"

# docker
alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dcp="docker-compose ps"
alias dcu="docker-compose up -d"
alias dcb="docker-compose build"
alias dcr="docker-compose restart"
alias dcd="docker-compose down"
alias dcl="docker-compose logs"
# exec into container bash entrypoint
dce() {
    docker-compose exec "$@" bash
}

# kubectl
alias k="kubectl"

# ip addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | grep inet"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

alias apt-up="sudo apt update && sudo apt upgrade"

