" nerdtree
" execute pathogen#infect()

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" https://github.com/junegunn/vim-plug
call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries' }
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'uarun/vim-protobuf'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'jparise/vim-graphql'
Plug 'lifepillar/pgsql.vim'

call plug#end()

" color
syntax enable
set background=dark
colorscheme solarized8

set number
set autoindent
set backspace=2
" 文件检测
:filetype on
:filetype plugin on
:filetype indent on

" 缩进
set tabstop=4
set shiftwidth=4
set expandtab
" 忽略大小写，高亮搜索，增量搜索
set ic hls is

set foldlevelstart=0
set foldlevel=99

" autocmd vimenter * NERDTree
" Python 文件专享
:autocmd FileType python :set foldlevel=0
:autocmd FileType python :set softtabstop=4
:autocmd FileType python :set foldmethod=indent
" rst 文件
:autocmd FileType rst :set expandtab
:autocmd FileType rst :set foldmethod=indent
:autocmd FileType rst :set softtabstop=4

:autocmd FileType go :set foldmethod=indent
:autocmd FileType gotpl :set expandtab
:autocmd FileType xml :set foldmethod=indent
:autocmd FileType json :set foldmethod=syntax
" 分屏快捷键映射
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
" 利用特殊的符号来区分 tab 和 space
set list
set listchars=tab:▸\ ,eol:¬
" 配色
" set background=dark
" colorscheme solarized

" 显示状态栏
set laststatus=2
" 显示行列
set ruler
" 显示 offset(byte)
" set statusline+=%o
set belloff=all
" 提示音
set noeb

" plugin: tagbar
nmap <F8> :TagbarToggle<CR>

" vim-go
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = 'goimports'
let g:go_fmt_options = {
  \ 'gofmt': '-s',
  \ 'goimports': '-local dev.rcrai.com'
  \ }
let g:go_echo_command_info = 1
let g:go_fmt_experimental = 1
let g:go_auto_fmt = 0

let g:go_metalinter_enabled = ['govet', 'errcheck', 'staticcheck', 'unused', 'gosimple', 'structcheck', 'varcheck', 'ineffassign', 'deadcode', 'typecheck', 'golint']

" Set the filetype based on the file's extension, but only if
" 'filetype' has not already been set
au BufRead,BufNewFile *.gotpl setfiletype gotexttmpl
au BufRead,BufNewFile *.api setfiletype proto

" postgresql plugin
let g:sql_type_default = 'pgsql'
