set shell=/bin/bash

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plugin 'junegunn/fzf.vim'
Plugin 'Exafunction/codeium.vim'  " Codeium, AI completion
Plugin 'agude/vim-eldar' " Eldar theme
Plugin 'vim-airline/vim-airline' " Airline
Plugin 'vim-airline/vim-airline-themes' " Airline
Plugin 'airblade/vim-gitgutter' " Git gutter
Plugin 'tpope/vim-sleuth' " autodetect indent
Plugin 'tpope/vim-obsession' " session manager
Plugin 'sheerun/vim-polyglot' " Syntax highlighting
Plugin 'Valloric/YouCompleteMe' " Autocomplete
Plugin 'godlygeek/tabular' " Tabularize
Plugin 'terryma/vim-multiple-cursors'
Plugin 'google/vim-codefmt' " Code formatter
Plugin 'google/vim-maktaba' " Vimscript plugin 
Plugin 'google/vim-glaive' " param updater
Plugin 'mbbill/undotree' " Undo tree
Plugin 'elzr/vim-json' " JSON
Plugin 'czheo/mojo.vim' " Mojo highlighting

call vundle#end()            " required
filetype plugin indent on    " required

" Keybindings
cmap w!! w !sudo tee > /dev/null %

syntax on
set clipboard=unnamed,unnamedplus
set completeopt-=preview
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set background=dark
colorscheme eldar 
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
set scrolloff=30               "keep at least 10 lines above/below cursor
set virtualedit=block          "Let block visual go past EOL
set list                       "show special chars (below)
set rnu
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set encoding=utf-8
set listchars=
set fileformats=unix,dos,mac
set nrformats-=octal
set noesckeys
set directory=$HOME/.vim/swapfiles//
set undodir=$HOME/.vim/undo//
set backupdir=$HOME/.vim/backup//

"set foldmethod=syntax          "use syntax folding by default
"set number                     "enable line numbers by default
"set listchars=tab:▸\
"set listchars+=extends:❯,precedes:❮
"set lazyredraw                 "save some computational power
"set autowrite                  "auto save when moving away via ^], fe
"set autowriteall               "same, but for :edit and family
"window toggle shortcuts
" set showbreak=↪                "put at the start of wrapped lines
"set colorcolumn=+1             "highilight the column after the textwidth value
"set nrformats=octal,hex,alpha  "make ^x and ^a intelligent
"set ignorecase smartcase       "use smart case searching
"set whichwrap=                 "no keys can wrap lines in normal/visual
"set hlsearch incsearch         "highlight as we go
"set showcmd                    "show the last ex command

"window navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType rust AutoFormatBuffer rustfmt
augroup END
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"Glaive codefmt yapf_executable="yapf --style={based_on_style: pep8, column_limit: 100}"

"macros
nnoremap gv gd[{V%::s/<C-R>///gc<left><left><left>
nnoremap gV gD:%s/<C-R>///gc<left><left><left>

"codeium
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
