#!/bin/sh

if [ "$1" = "-i" ]; then
  sudo sed -i 's/us.debian.org/de.debian.org/' /etc/apt/sources.list
  sudo apt-get -y update
  cat ~/.dotfiles/core.dpkg | xargs sudo apt-get -y install
  for var in "$@"
  do
    if [ -f ~/.dotfiles/$var.dpkg ]; then
      cat ~/.dotfiles/$var.dpkg | xargs sudo apt-get -y install
    fi
    if [ -f ~/.dotfiles/$var ]; then
      cat ~/.dotfiles/$var | xargs sudo apt-get -y install
    fi
  done
  # sudo apt-get -y upgrade
  # sudo apt-get -y dist-upgrade
fi

ln -f -s ~/.dotfiles/.zshrc ~/.zshrc
ln -f -s ~/.dotfiles/.zshenv ~/.zshenv
ln -f -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/.dotfiles/.git_global_ignore ~/.git_global_ignore
ln -f -s ~/.dotfiles/.vimrc ~/.vimrc
if [ -d ~/.vim/bundle/vundle ]; then
  cd ~/.vim/bundle/vundle; git pull origin
else 
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +BundleInstall +qall
sudo gem install tmuxinator
sudo debsecan-create-cron
sudo sh -c 'grep security /etc/apt/sources.list > /etc/apt/security.sources.list'
cat ~/.dotfiles/cron-apt.config | sudo tee /etc/cron-apt/config > /dev/null

for var in "$@"
do
  if [ $var = "xwindow" ]; then
    ln -f -s ~/.dotfiles/.xinitrc ~/.xinitrc
    ln -f -s ~/.dotfiles/.Xdefaults ~/.Xdefaults
    ln -f -s ~/.dotfiles/.xmodmap ~/.xmodmap
    mkdir -p ~/.xmonad/
    ln -f -s ~/.dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
    xmonad --recompile
  fi
  if [ $var = "dev" ]; then
    sudo pip install ansible
    vagrant plugin install vagrant-vbox-snapshot
    sudo gem install digital_ocean
  fi
done
