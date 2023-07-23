#!/bin/sh

# make necessary directories
mkdir -p ~/.config/tmux
mkdir -p $HOME/.vim/swapfiles//
mkdir -p $HOME/.vim/undo//
mkdir -p $HOME/.vim/backup//

# install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt install build-essential cmake vim-nox python3-dev

# copy files
cp ./.vimrc ~
cp ./tmux.conf ~/.config/tmux/tmux.conf

# vim plugins + YCM 
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer --rust-completer

# Source tmux
tmux source ~/.config/tmux/tmux.conf
