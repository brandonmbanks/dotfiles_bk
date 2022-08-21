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

alias ssconf="vim ~/.config/starship.toml"

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}

starship_precmd_user_func="set_win_title"

eval "$(starship init bash)"
