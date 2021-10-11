" nerdtree
" execute pathogen#infect()

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

" https://github.com/junegunn/vim-plug
call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries' }
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
" Plug 'pedrohdz/vim-yaml-folds'
Plug 'uarun/vim-protobuf'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'jparise/vim-graphql'
Plug 'lifepillar/pgsql.vim'

Plug 'wakatime/vim-wakatime'
Plug 'lifepillar/pgsql.vim'

Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
"
Plug 'google/vim-jsonnet'

call plug#end()

" color
syntax enable
set background=dark
let g:solarized_termtrans = 1 " This gets rid of the grey background
colorscheme solarized8
highlight SpecialKey ctermbg=None ctermfg=66

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

:autocmd FileType javascript :set tabstop=2
:autocmd FileType javascript :set softtabstop=2
:autocmd FileType javascript :set shiftwidth=2
" 分屏快捷键映射
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
" 利用特殊的符号来区分 tab 和 space
set list
set listchars=tab:▸\ ,eol:¬

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

let g:go_metalinter_enabled = ['govet', 'errcheck', 'staticcheck', 'unused', 'gosimple', 'structcheck', 'varcheck', 'ineffassign', 'deadcode', 'typecheck', 'golint']

" Set the filetype based on the file's extension, but only if
" 'filetype' has not already been set
au BufRead,BufNewFile *.gotpl setfiletype gotexttmpl
au BufRead,BufNewFile *.api setfiletype proto
au BufRead,BufNewFile *.proto setfiletype proto

" postgresql plugin
let g:sql_type_default = 'pgsql'

" Jenkinsfile highlight
au BufNewFile,BufRead Jenkinsfile setf groovy

" TODO
set mmp=2000

" javascript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" javascript

" vim-lsp
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'allowlist': ['python'],
"         \ })
" endif
"
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gs <plug>(lsp-document-symbol-search)
"     nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> <leader>rn <plug>(lsp-rename)
"     nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
"     inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"     inoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"     let g:lsp_format_sync_timeout = 1000
"     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"
"     " refer to doc to add more commands
" endfunction
"
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
" vim-lsp
