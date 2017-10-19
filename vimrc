syntax enable

execute pathogen#infect()
filetype plugin indent on

set number
set autoindent
set backspace=2
" 缩进
set tabstop=4
set shiftwidth=4
set expandtab
" 忽略大小写，高亮搜索，增量搜索
set ic hls is
" 折叠
set foldmethod=indent
" 文件检测
:filetype on
:filetype plugin on
:filetype indent on
" Python 文件专享
:autocmd FileType python :set foldlevel=0
:autocmd FileType python :set softtabstop=4
" rst 文件
:autocmd FileType rst :set expandtab
:autocmd FileType rst :set foldmethod=indent
:autocmd FileType rst :set softtabstop=4
" 分屏快捷键映射
" map <c-h> <c-w>h
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" 利用特殊的符号来区分 tab 和 space
set list
set listchars=tab:▸\ ,eol:¬
" 配色
set background=dark
colorscheme solarized

" 显示状态栏
set laststatus=2
" 显示行列
set ruler
