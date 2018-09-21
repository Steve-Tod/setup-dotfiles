set encoding=utf-8
set nocompatible             
set fileformat=unix           
set shiftwidth=2 | set expandtab 
syntax on
set nu
let NERDTreeShowHidden=1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
