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
  bash coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl vim neovim

xcode-select --install

# git
brew install git
git config --global color.ui auto

# setup bashrc
mkdir -p ~/projects/personal
git clone https:://github.com/brandonmbanks/dotfiles.git ~/projects/personal
ln -s ~/projects/personal/dotfiles/.bash_profile .
ln -s ~/projects/personal/dotfiles/.bashrc .
ln -s ~/projects/personal/dotfiles/.bash_aliases .
# ignore case in tab completion
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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
asdf install kubectl latest
asdf global kubectl latest

# install node
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install node latest
asdf global node latest

# install python
asdf plugin add python
asdf install python latest
asdf global python latest

exec bash # reload shell
