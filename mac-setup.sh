# ssh dir
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# installing packages
brew update

brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl

xcode-select --install

# download antigen
curl -L git.io/antigen > ~/antigen.zsh

# git
brew install git
git config --global color.ui auto

# kubernetes
brew cask install minikube
rm -rf ~/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
if grep -Fq "asdf" ~/.zshrc
then
    # asdf sh completion already exists
else
    echo -e '\n# asdf' >> ~/.zshrc
    echo -e '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
    echo -e '. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
    zsh  # reload shell
fi
# install kubectl
asdf plugin-add kubectl
asdf install kubectl 1.14.1

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
if grep -Fxq "nvm" ~/.zshrc
then
    # nvm sh completion already exists
else
    echo -e '\n# nvm' >> ~/.zshrc
    echo -e 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo -e '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> ~/.zshrc
    echo -e '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc
    zsh  # reload shell
fi
nvm install node

# python
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
if grep -Fxq "pyenv" ~/.zshrc
then
    # pyenv sh completion already exists
else
    echo -e '\n# pyenv' >> ~/.zshrc
    echo -e 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo -e 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
    zsh  # reload shell
fi
pyenv install 3.7.3

