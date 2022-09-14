export PATH=/usr/local/bin:$PATH

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# go
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export GOPATH=$HOME/go

# rust
. "$HOME/.cargo/env"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

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
