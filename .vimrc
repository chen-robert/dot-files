set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set autoindent
filetype plugin indent on
syntax on

au BufNewFile,BufRead *.ejs set filetype=html

set hlsearch

autocmd BufWritePre * :%s/\s\+$//e
