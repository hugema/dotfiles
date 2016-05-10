#!/bin/sh

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

