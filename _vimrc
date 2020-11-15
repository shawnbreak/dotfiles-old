" BASIC
syntax on
set cursorline
set hlsearch
set incsearch " incremental search, search as you type
set number
set relativenumber
set ruler
set guifont=Consolas:h12:b
set noerrorbells
set vb t_vb= " set vb " visual bells
set nocompatible
filetype plugin on
set nobackup
set noswapfile
set history=1024
set autochdir

set wildmenu
set wildmode=full

" set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start whichwrap+=<,>,[,]
set clipboard+=unnamed

set foldenable
set foldmethod=indent

" ENCODEING
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'


" WINDOW
set lines=35 columns=140
set splitbelow
set splitright
set guioptions= " egmrLtTb

" TRAILING CHARS
set list
set listchars=trail:·,extends:>,precedes:<

" INDENTENT
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4 softtabstop=4 expandtab


" source $home\.vim\custom\statusline.vim
" PLUGIN
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

" let g:airline_theme='bubblegum'
colorscheme gruvbox


" KEYMAP
let mapleader=","

" **NORMAL Map**
nmap <leader>s :source $MYVIMRC<cr>
nmap <leader>e :e $MYVIMRC<cr>

nmap <leader>tn :tabnew<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>th :tabp<cr>
nmap <leader>tl :tabn<cr>

" move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" resize windows
nnoremap <M-j> :resize -5<CR>
nnoremap <M-k> :resize +5<CR>
nnoremap <M-h> :vertical resize +5<CR>
nnoremap <M-l> :vertical resize -5<CR>

" concept:  fact line and screen line
" make j,k move base the screen line
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" opent current directory in explorer
nmap <silent> <leader>ex :!start explorer %:p:h<CR>

" open cmd and cd to current directory
nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>

" print current time
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

" **INSERT Map**

" move in the insertion mode
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

" IDE like delete
inoremap <C-BS> <Esc>bdei

" **COMMAND Map**

" move to the start or the end of the line
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cmap <C-V> <C-R>+


" **VISUAL Map**
