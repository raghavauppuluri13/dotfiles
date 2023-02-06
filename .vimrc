set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'agude/vim-eldar'
Plugin 'rhysd/vim-clang-format'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'tomasr/molokai'
Plugin 'maxbrunsfeld/vim-yankstack' " emacs style kill-ring
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim' " Ctrl P
Plugin 'airblade/vim-gitgutter' " Git gutter
Plugin 'tpope/vim-fugitive' " Git commands
Plugin 'Valloric/YouCompleteMe' " YCM
Plugin 'godlygeek/tabular' " Tabularize
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'AndrewRadev/switch.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'rosenfeld/conque-term'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-dispatch'
Plugin 'klen/python-mode'
Plugin 'elzr/vim-json'
Plugin 'easymotion/vim-easymotion'

call vundle#end()            " required
filetype plugin indent on    " required


set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
set clipboard=unnamed,unnamedplus
set expandtab
set tabstop=4
set shiftwidth=4

set background=dark
set autoindent                 "use indentation of previous line
set laststatus=2               "Always display the statusline in all windows
set hidden                     "hide buffers, don't abandon them
set visualbell                 "use visual cue for error
set ttyfast                    "improve screen redrawing
set undofile                   "save undo history to file
set splitright                 "default split behavior
set autoread                   "reread files that changed outside vim
set title                      "use a title
set cursorline                 "highlight the current line
set history=1000               "keep a longer ex history
set undoreload=1000            "keep a longer undo history
set backspace=indent,eol,start "let insert mode backspace be useful
set scrolloff=10               "keep at least 10 lines above/below cursor
set virtualedit=block          "Let block visual go past EOL
set list                       "show special chars (below)
set rnu
set number                     " Show current line number
set relativenumber
set encoding=utf-8
set listchars=
set fileformats=unix,dos,mac
set nrformats-=octal
set noesckeys
set directory=$HOME/.vim/swapfiles//
set undodir=$HOME/.vim/undo//

autocmd FileType cpp ClangFormatAutoEnable

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
