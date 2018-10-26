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

" 配置补全 you_complete_me 开始
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  " 启用默认配置
let g:ycm_confirm_extra_conf = 0  " 关闭重复打开提醒
let g:ycm_python_binary_path = 'python3'  " 使用 python3 作为 python interpreter
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 配置补全 you_complete_me 结束

" UltiSnips
" 插入模式下直接通过<C-z>键来触发UltiSnips的代码块补全
let g:UltiSnipsExpandTrigger="<C-z>"
" 弹出UltiSnips的可用列表,由于不常用, 所以这里设置成了特殊的<C-i>映射
let g:UltiSnipsListSnippets="<C-i>"
" <C-f>跳转的到下一个代码块可编辑区
let g:UltiSnipsJumpForwardTrigger="<C-f>"
" <C-b>跳转到上一个代码块可编辑区
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
