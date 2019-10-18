alias c="clear"
alias zshconfig="vim ~/.zshrc"
alias gfo="git fetch origin"
alias gcom="git checkout master"
alias gcb="git checkout -b"
alias glod="git pull origin develop"
alias glr="git pull --rebase"
alias gpo="git push origin"
alias grd="git rebase develop"
alias ga.="git add . -u"
# add tracked files and commit with passed message
gcaa() {
    git add . -u
    git commit -m "$@"
}

alias cda="composer dump-autoload"
alias punit="./vendor/bin/phpunit"
alias mrs="php artisan migrate:refresh --seed"

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

alias cb="git rev-parse --abbrev-ref HEAD"
alias gbdl="git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D"

# ip addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

