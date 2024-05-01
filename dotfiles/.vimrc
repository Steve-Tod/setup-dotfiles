set encoding=utf-8
set nocompatible             
set fileformat=unix           
set shiftwidth=4 | set expandtab 
syntax on
set nu
let NERDTreeShowHidden=1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'SirVer/ultisnips'
" Plugin 'Steve-Tod/vim-snippets'
" Plugin 'ervandew/supertab'
call vundle#end()
filetype plugin indent on


vnoremap <C-r> "hy:%s,<C-r>h,,gc<left><left><left>
" YCM start
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  " Default conf
let g:ycm_confirm_extra_conf = 0  " close comfirmation
let g:ycm_python_binary_path = 'python3'  " use python3 as python interpreter
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" YCM end

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" let g:snips_author = "Zhenyu Jiang"
" let g:snips_email = "stevetod98@gmail.com"
" let g:snips_github = "https://github.com/Steve-Tod"
