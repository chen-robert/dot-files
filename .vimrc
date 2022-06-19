set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set backspace=indent,eol,start

set autoindent
filetype plugin indent on
syntax on

au BufNewFile,BufRead *.ejs set filetype=html

set hlsearch
set noincsearch

call plug#begin()

Plug 'APZelos/blamer.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomlion/vim-solidity'


if has('nvim')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
endif

call plug#end()

if has('nvim')

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors
highlight NvimTreeFolderIcon guibg=blue

if $NVIM_PLUGIN_INSTALLING == ""
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
require'nvim-tree'.setup()
EOF

let g:tokyonight_colors = {
  \ 'comment': '#899ddf',
  \ }

let g:tokyonight_style = "night"
colorscheme tokyonight
else
  echo "skipping install step"
endif

endif

nnoremap <leader>sv :source $MYVIMRC<CR>
autocmd BufWritePre * :%s/\s\+$//e

nnoremap <CR><CR> :noh<return>

cabb W w
cabb Q q

au BufNewFile,BufRead *.fun set filetype=sml

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
