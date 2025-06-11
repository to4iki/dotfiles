" Basic Settings ---------------------
set nocompatible
set hidden
set backspace=indent,eol,start
set clipboard+=unnamed
set belloff=all
filetype plugin indent on

" Visual Settings ------------------
syntax on
set number
set nowrap
set smartindent
set termguicolors
set cursorline

" Display special characters
set list
set listchars=tab:»-,trail:_,extends:>,precedes:<,nbsp:%
set showmatch

" Tab settings
set ts=2 sw=2 sts=0
set expandtab
set autoindent
set showtabline=2

" Status Line
set laststatus=2
set showcmd
set statusline=%f%m%=%y[%{&fileencoding}][%{&fileformat}]

" Search Settings ------------------
set hlsearch
set ignorecase
set smartcase
set incsearch

" File Management -----------------
set autoread
set noswapfile
set nobackup
set visualbell t_vb=
set modeline
set modelines=3

" Completion
set wildmenu
set omnifunc=syntaxcomplete#Complete

" Key Mappings -------------------
" Normal Mode
nnoremap x "_x
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

" Tab operations
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

" Window operations
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>

" Clear search highlight
nnoremap <F3> :noh<CR>

" Insert Mode
inoremap <silent> jj <ESC>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Visual Mode
vnoremap x "_x
vnoremap v ^$h

" Auto Commands ------------------
" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Auto save (current buffer only)
set updatetime=1000
autocmd CursorHold * update
