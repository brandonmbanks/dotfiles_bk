export PATH=/usr/local/bin:$PATH

# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export GOPATH=$HOME/go

# rust
. "$HOME/.cargo/env"

export BASH_SILENCE_DEPRECATION_WARNING=1

# default editor
EDITOR='vim'

# append to history
shopt -s histappend
# history settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# source aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

eval "$(starship init bash)"
