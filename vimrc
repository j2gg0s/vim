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
" 文件检测
:filetype on
:filetype plugin on
:filetype indent on
" Python 文件专享
:autocmd FileType python :set foldlevel=0
:autocmd FileType python :set softtabstop=4
:autocmd FileType python :set foldmethod=indent
" rst 文件
:autocmd FileType rst :set expandtab
:autocmd FileType rst :set foldmethod=indent
:autocmd FileType rst :set softtabstop=4

:autocmd FileType go :set foldmethod=indent
:autocmd FileType xml :set foldmethod=indent
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

set belloff=all
let g:go_fmt_autosave = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
nmap <F8> :TagbarToggle<CR>

autocmd BufEnter SConstruct :setlocal filetype=python
autocmd BufEnter SConscript :setlocal filetype=python

" ctags
map <F9> :!ctags -R -f ~/.language_tags/.python.tags `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
" ctags -> gutentags
let g:gutentags_ctags_tagfile = '.gutentags'
:autocmd FileType python :set tags+=~/.language_tags/.python.tags
