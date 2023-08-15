#!/bin/sh

# make necessary directories
mkdir -p ~/.config/tmux
mkdir -p $HOME/.vim/swapfiles//
mkdir -p $HOME/.vim/undo//
mkdir -p $HOME/.vim/backup//

# install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt update
sudo apt install build-essential cmake vim-nox python3-dev fzf silversearcher-ag python3-autopep8 vim-gtk3 black -y

# copy files
cp ./vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf

# vim plugins + YCM 
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer --rust-completer

# git configs

git config --global user.name "Raghava Uppuluri"
git config --global user.email raghava.upp13@gmail.com
git config --global core.editor vim
