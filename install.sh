#!/bin/sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp ./.vimrc ~
cp ./.tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/tmux && cp tmux.conf "$_"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

vim +PluginInstall +qall

apt install build-essential cmake vim-nox python3-dev
python3 ~/.vim/bundle/YouCompleteMe/install.py --all

tmux source ~/.config/tmux/tmux.conf
