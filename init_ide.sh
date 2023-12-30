#!/bin/sh

# make necessary directories
mkdir -p ~/.config/tmux
mkdir -p $HOME/.vim/swapfiles//
mkdir -p $HOME/.vim/undo//
mkdir -p $HOME/.vim/backup//

# install
sudo add-apt-repository ppa:jonathonf/vim # vim 9.0
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt update
sudo apt install build-essential cmake vim-nox python3-dev vim fzf silversearcher-ag python3-autopep8 black -y

# copy files
./update_local_from_dotfiles.sh

# vim plugins + YCM 
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer --rust-completer
