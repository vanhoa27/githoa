" [MYVIMRC settings]
"-------------------------------------"

"options
set number
set rnu
set nowrap
set cc=80
set nocul

"indentation:
set autoindent
set smartindent
set sw =4 "set shiftwidth
set expandtab
set smarttab
set tabstop=4
set softtabstop =4

"search
set hlsearch
set wildmenu "browse through files with :edit <tab>
set wildignore
set nocompatible ":b <tab> to navigate through buffers
set incsearch 
set ignorecase
set smartcase
set scrolloff =10
set sidescrolloff =10
set path +=**

"keymaps
let g:mapleader =' '
nnoremap <leader>e :Lex 30<CR>
nnoremap <C-q> :q <CR>
nnoremap <leader>ss :split<CR>
nnoremap <leader>so <C-w>o
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>h :noh<CR>
" nnoremap <C-k> :bn<CR>a 
" nnoremap <C-j> :bp<CR>a 
" nnoremap <leader>bk :bw<CR>a 

"splits
set splitright
set splitbelow

"colors
syntax on
let g:lightline = {'colorscheme': 'catppuccin_frappe'}
color evening
set tgc "set termiguicolors
set noshowmode 
"grammer
"set spell
set spl=en
set spellsuggest=best

"FileExplorer
let g:netrw#banner=0 "Disables the banner
let g:netrw#liststyle =3 "Tree view

"Vim-Airline
let g:airline#theme = "onedark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"Plugins

call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
    Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
    Plug 'https://github.com/vim-airline/vim-airline' " Status bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

" :PlugClean :PlugInstall :UpdateRemotePlugins

"PLUGINSETTINGS
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd FileType c let b:coc_pairs_disabled = ["<"]
autocmd FileType python let b:coc_pairs_disabled = ["<"]

nnoremap gd <Plug>(coc-definition)
