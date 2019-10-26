# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  echo "creating zgen save"

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/common-aliases
  zgen oh-my-zsh plugins/command-not-found

  # syntax highlighting bundles
  zgen load zsh-users/zsh-syntax-highlighting

  # auto update zgen and bundles
  zgen load unixorn/autoupdate-zgen

  # load theme
  zgen load brandonmbanks/databanks-zsh-theme databanks

  # save all to init script
  zgen save
  zcompile ${ZDOTDIR:-${HOME}}/.zgen/init.zsh
fi

export EDITOR='vim'

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

export PATH=/usr/local/bin:$PATH

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

