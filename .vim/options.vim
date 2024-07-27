"----------------------------------------
"      Set
"----------------------------------------
"set number
set encoding=utf-8
scriptencoding utf-8
set autoindent
set tabstop=4
set shiftwidth=4
set nobackup
set splitright
set clipboard=unnamed
set hls
set hidden
filetype plugin indent on
syntax enable
colorscheme molokai
syntax on
set t_Co=256
set termguicolors "point
set background=dark
set cursorline
set cursorcolumn
set buftype=
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set cursorline
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor
"set list
"set listchars=tab:»',trail:-,eol:↲,extends:»,precedes:«,nbsp:%'
