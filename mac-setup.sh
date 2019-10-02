# ssh dir
mkdir $HOME/.ssh
chmod 0700 $HOME/.ssh

# installing packages
brew update

brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl

xcode-select --install

# git
brew install git
git config --global user.name "Brandon Banks"
git config --global user.email "b93banks@gmail.com"
git config --global color.ui auto

# kubernetes
brew cask install minikube
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
# reload shell
zsh
# install kubectl
asdf plugin-add kubectl
asdf install kubectl 1.14.1

# python
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pyenv install 3.7.3

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node
