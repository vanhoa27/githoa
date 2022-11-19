set spell "set spl= <language>, to change language
set cul "spawns cursorline --> set nocul to disable
set rnu
set nu
set mouse=a
set signcolumn=yes
set autoindent 
set smarttab
set shiftwidth=4
set tabstop=4 softtabstop=4
set nohlsearch
set noerrorbells
set expandtab
set smartcase
set smartindent
set incsearch
set scrolloff=8
set termguicolors
set hidden
set g:mapleader = " "

" nnoremap <C-c> <ESC>"+y  

nnoremap <leader>e :Lex 30
inoremap <leader>e <ESC>:Lex 30

nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>a

nnoremap <C-q> :q<CR>
inoremap <C-q> <ESC>:q<CR>a

call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'gruvbox-community/gruvbox'
    Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
    Plug 'https://github.com/preservim/nerdtree' " NerdTree
    Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
    Plug 'https://github.com/vim-airline/vim-airline' " Status bar
	Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal 
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" :PlugClean :PlugInstall :UpdateRemotePlugins

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

colorscheme gruvbox
highlight Normal guibg=none

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd FileType c let b:coc_pairs_disabled = ["<"]
autocmd FileType python let b:coc_pairs_disabled = ["<"]

nnoremap gd <Plug>(coc-definition)
