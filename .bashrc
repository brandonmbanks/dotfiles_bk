export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

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

test -f ~/.git-completion.bash && . $_

export BASH_SILENCE_DEPRECATION_WARNING=1

# default editor
EDITOR='nvim'

# append to history
export PROMPT_COMMAND='history -a'
# history settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git . $HOME"
export FZF_ALT_C_COMMAND="fd -t d --hidden --exclude $HOME/Library . $HOME"

# source aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

alias ssconf="vim ~/.config/starship.toml"

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}

starship_precmd_user_func="set_win_title"

eval "$(starship init bash)"
