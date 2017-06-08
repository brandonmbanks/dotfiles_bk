# Path to your oh-my-zsh installation.
export ZSH=/Users/banks/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
  ZSH_THEME="databanks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm brew osx)

# User configuration

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

DEFAULT_USER=`whoami`


# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias art="php artisan"
alias gfo="git fetch origin"
alias gcod="git checkout develop"
alias gcom="git checkout master"
alias gcob="git checkout -b '$*'"
alias glod="git pull origin develop"
alias glr="git pull --rebase"
alias gpo="git push origin"
alias grd="git rebase develop"
alias ga.="git add . -u"
alias c="clear"
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

alias cb="git rev-parse --abbrev-ref HEAD"
alias gbdl="git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D"

alias gentux="cd ~/source/gentux"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

gcaa() {
    git add . -u
    git commit -m "$@"
}

dce() {
    docker-compose exec "$@" bash
}

homestead() {
    ( cd ~/Homestead && vagrant $* )
}

export NVM_DIR="/Users/banks/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/npm/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/share/dotnet:$PATH"

# go
export GOPATH=$HOME/source
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# The next line updates PATH for the Google Cloud SDK.
source '/Users/banks/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/banks/google-cloud-sdk/completion.zsh.inc'

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$(brew --prefix git)/bin:$PATH"
