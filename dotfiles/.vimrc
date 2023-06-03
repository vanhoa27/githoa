" [MYVIMRC settings]
"-------------------------------------"

"OPTIONS
set number
set rnu
set nowrap
set cmdheight=1
autocmd FileType tex,md,org set conceallevel=2 "conceal text for latex documents
set nocul
set updatetime=300
set signcolumn=yes
syntax enable

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"presettings
set nocompatible 
set encoding=utf-8
set nobackup
set nowritebackup
if has('gui_running')
    set guifont=Hack\ Nerd\ Font\ Mono\ 11
endif

"indentation:
set autoindent
set smartindent
set breakindent 
set showbreak=>\
set shiftwidth =4 "set shiftwidth
set expandtab
set smarttab
set tabstop=4
set softtabstop =4
filetype plugin indent on 
filetype plugin on 

"search
set hlsearch
set wildmenu 
set wildignorecase 
set incsearch 
set ignorecase
set smartcase
set scrolloff =4
set showbreak =">"

"completion
set complete=.,w,b,u,kspell
set wildmode=list:longest,full
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"KEYMAPS
let g:mapleader =' '
let maplocalleader =' '

" FileEx 
nnoremap <leader>e :NERDTreeToggle<CR>

" Refactoring
nnoremap <leader>rn <Plug>(coc-rename) 
xmap <leader>lf  <Plug>(coc-format-selected)
nnoremap <leader>lf  <Plug>(coc-format-selected)

nnoremap <leader>lo editor.action.organizeImport

nmap <silent> <leader>rf <Plug>(coc-codeaction-refactor)

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Fuzzy Finder
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fr :History<cr>
nnoremap <leader>fc :History:<cr>
nnoremap <leader>fT :Filetypes<cr>
nnoremap <leader>fh :Helptags<cr>

"new window
nnoremap <leader>h :noh<CR>
nnoremap <leader>lw :loadview<CR>
nnoremap <leader>te :tabedit<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>

"better navigation movements
nnoremap <c-d> <c-d>zz 
nnoremap <c-u> <c-u>zz

"delete a whole world in insert mode like normal
inoremap <C-h> <C-w>

"better use of clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

"show current buffers
nnoremap <leader>bi :buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

"wipe out current buffer
nnoremap <leader>bw :bw<CR> 
nnoremap <leader>bk :bw<CR> 
map gf :edit <cfile><CR> 
"splits
set splitright
set splitbelow

"colors
syntax on
let g:lightline = {'colorscheme': 'gruvbox'}
colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE
set bg =dark
set tgc 
set noshowmode 

"FileExplorer
let g:netrw_liststyle = 4

let g:netrw_hide = 5 "Hide dotfiles on starup, "gh" to show"
let g:netrw_keepdir = 0
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

""air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""Vim-Airline
let g:airline#theme = "auto"
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Terminal
let g:split_term_resize_cmd = 'resize 6' 
let g:split_term_style = 'vertical'
map <M-F12> :let $VIM_DIR=expand('%:p:h')<CR>:vert:term<CR>cd $VIM_DIR<CR>
tnoremap <M-F12> <C-u>exit<CR>

" COMPILING
autocmd filetype c nnoremap <f8> :w<cr>:!gcc -g -Wall -std=c11 % -o %< && ./%< <CR>
nnoremap <f9> :!./%<<cr>

autocmd FileType c setlocal makeprg=gcc\ %\ -g\ -Wall\ -std=c11\ -o\ %< 
autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+17\ \-Wall

 "Plugins
call plug#begin()
     Plug 'neoclide/coc.nvim', {'branch': 'release'} "turn vim into an IDE
     Plug 'http://github.com/tpope/vim-surround' "Surrounding ysw)
     Plug 'https://github.com/tpope/vim-commentary' "For Commenting gcc & gc
     Plug 'https://github.com/vim-airline/vim-airline' "Status bar
     Plug 'vim-airline/vim-airline-themes' "Status bar themes
     Plug 'lervag/vimtex' "plugin for writing latex files
     Plug 'SirVer/ultisnips' "plugin for snippets
     Plug 'honza/vim-snippets' "snippets for C
     Plug 'junegunn/goyo.vim'
     Plug 'junegunn/limelight.vim'

     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
     Plug 'junegunn/fzf.vim'
     Plug 'preservim/nerdtree'
call plug#end()

    " :PlugClean :PlugInstall :UpdateRemotePlugins

"[[COC SETTINGS]]
    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <leader>co :CocCommand <CR>
autocmd FileType c let b:coc_pairs_disabled = ["<"]
autocmd FileType python let b:coc_pairs_disabled = ["<"]
autocmd FileType tex let b:coc_pairs_disabled = ["<"]

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" might want to remove if not helpful
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"find source faster
nnoremap gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"use ctrl-j and ctrl-h to select suggestions
inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Applying code actions to the selected code block.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
vmap <leader>ca  <Plug>(coc-codeaction-selected)

xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)
vmap <leader>la  <Plug>(coc-codeaction-selected)

" Remap keys for apply code actions at the cursor position.
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
nmap <leader>la  <Plug>(coc-codeaction-cursor)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" [[VIMTEX]] {{{
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method = 'latexmk' 
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" let g:vimtex_quickfix_mode=0

autocmd FileType md,tex,org setlocal spell "only sets spell for certain filetype
set spelllang=de,en_us "you can set multiple languages at once
set spellsuggest=best
"will indent specific files differently
" filetype plugin indent on
"autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab

" [[ULTISNIP]]{{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"
" }}}

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader>zz :Goyo<CR> 

highlight Normal guibg=NONE ctermbg=NONE
