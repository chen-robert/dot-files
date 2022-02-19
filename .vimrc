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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
