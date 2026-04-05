" ---------- Basic settings ----------
set nocompatible
set number              " Show line numbers
set relativenumber      " Relative line numbers for quick movement
set tabstop=4           " Tab width = 4 spaces
set shiftwidth=4        " Auto-indent width
set expandtab           " Convert tabs to spaces
set autoindent
set smartindent

set hlsearch            " Highlight search results
set incsearch           " Incremental search
set ignorecase          " Ignore case when searching
set smartcase           " But respect case if uppercase is included

set showmatch           " Highlight matching brackets

set nowrap              " Disable line wrap

inoremap jk <Esc>       " Exit insert mode by typing 'jk'


" ---------- C++ support ----------
filetype plugin indent on
syntax on

" ---------- Plugins ----------
call plug#begin('~/.vim/plugged')

" Auto close brackets
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ---------- Appearance ----------
set termguicolors       " Enable true color

" ---------- Command ----------
command! Copy :w !pbcopy

