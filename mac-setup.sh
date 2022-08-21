# ssh dir
mkdir -p $HOME/.ssh
chmod 0700 $HOME/.ssh

# install homebrew
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    : # homebrew already installed
fi

# installing packages
brew update

brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl

xcode-select --install

# git
brew install git
git config --global color.ui auto

# kubernetes
brew cask install minikube
# download asdf if not exists
[ -d ~/.asdf ] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
cd -
if [ $(cat ~/.bashrc | grep -c "asdf") -eq 0 ];
then
    echo '\n# asdf' >> ~/.bashrc
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
    source ~/.bashrc > /dev/null 2>&1 # reload shell
else
    : # asdf sh completion already exists
fi
# install kubectl
asdf plugin-add kubectl
asdf install kubectl 1.14.1
touch ~/.tool-versions
echo "kubectl 1.14.1" > ~/.tool-versions

# node
# download nvm if not exists
[ -d "~/.nvm" ] || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash && source ~/..bashrc > /dev/null 2>&1
nvm install node

# python
# download pyenv if not exists
[ -d ~/.pyenv ] || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
if [ $(cat ~/..bashrc | grep -c "pyenv") -eq 0 ];
then
    echo '\n# pyenv' >> ~/..bashrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/..bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/..bashrc
    echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/..bashrc
    source ~/..bashrc > /dev/null 2>&1 # reload shell
else
    : # pyenv sh completion already exists
fi
pyenv install 3.10.2
pyenv global 3.10.2
exec zsh # reload shell

