" dein {{{
let s:nvim_dir = expand('~/.config/nvim')
let s:dein_dir = s:nvim_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)
call dein#load_toml(s:nvim_dir . '/plugins.toml', {'lazy': 0})
call dein#end()
" }}}

" Common {{{
set nocompatible
set number
set backspace=2
set nowrap
set smartindent
set clipboard+=unnamed
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
filetype plugin indent on

" Color
syntax enable
syntax on
colorscheme molokai

" brackets
set showmatch
set list listchars=trail:_
set showmatch

" Tab
set ts=2 sw=2 sts=0
set expandtab
set autoindent
set showtabline=4

" Completion
set wildmenu
set omnifunc=syntaxcomplete#Complete

" Search
set hlsearch
set ignorecase
set smartcase
set incsearch

" Option
set autoread
set noswapfile
set nobackup
set visualbell t_vb=

" Line
set modeline
set modelines=3
set laststatus=2
set showcmd

" Status Line
set statusline=%f%m%=%y[%{&fileencoding}][%{&fileformat}]

" Auto Save
autocmd CursorHold * wall
set updatetime=100

nnoremap x "_x
vnoremap x "_x

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>

" highlight
nnoremap <F3> :noh<CR>

" InsertMode
inoremap <silent> jj <ESC>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" VisualMode
vnoremap v ^$h

" Language {{{
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" }}}

" NERDCommenter {{{
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle
" }}}
