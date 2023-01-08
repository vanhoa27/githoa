# VimTex

<!--toc:start-->
- [VimTex](#vimtex)
  - [Spelling](#spelling)
  - [Formating](#formating)
    - [Conceal (will make \[, \], $, \in invisible )](#conceal-will-make-in-invisible)
  - [Ultisnip](#ultisnip)
    - [snippet for "Signature"](#snippet-for-signature)
    - [dynamic snippets use `<text>`](#dynamic-snippets-use-text)
    - [use pyhton on a snippet box](#use-pyhton-on-a-snippet-box)
    - [insert an environment](#insert-an-environment)
    - [flags](#flags)
    - [vimwiki keymaps](#vimwiki-keymaps)
    - [vimwiki diary](#vimwiki-diary)
<!--toc:end-->

## Spelling

- set spell
- set spelllang=de

- [s search forwards for wrong spelled words
- ]s search backwards for wrong spelled words

- zg add word under cursor as correctly spelled into spellfile
- zug undo zg

- zw add word under cursor as wrongly spelled into spellfile
- zuw undo zw

- z= list correct suggesions

- Disable File for differenet filetypes
- autocmd FileType python setlocal nospell

## Formating

- filetype plugin on
- fileau BufEnter \*.tex set autowrite

- let g:Tex_DefaultTargetFormat = 'pdf'
- let g:Tex_MultipleCompileFormats = 'pdf'
- let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $\*'
- let g:Tex_GotoError = 0
- let g:Tex_ViewRule_pdf = 'evince'type indent on

- Plug 'lervag/vimtex'
- let g:tex_flavor='latex'
- let g:vimtex_view_method='zathura'
- let g:vimtex_quickfix_mode=0

### Conceal (will make \[, \], $, \in invisible )

- set conceallevel=1
- let g:tex_conceal='abdmg

## Ultisnip

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

### snippet for "Signature"

snippet sign "Signature"
Yours sincerely,

Van Hoa Nguyen
endsnippet

### dynamic snippets use `<text>`

snippet today "Date"
`date +%F`
endsnippet

### use pyhton on a snippet box

snippet box "Box"
`!p snip.rv = '┌' + '─' * (len(t[1]) + 2) + '┐'`
│ $1 │
`!p snip.rv = '└' + '─' * (len(t[1]) + 2) + '┘'`
$0
endsnippet

### insert an environment

snippet beg "begin{} / end{}" bA
\begin{$1}
$0
\end{$1}
endsnippet

### flags

- b snippet will only expand at beginning
- A autoexpand
- $1, $2 ...$0 (places to jump to with tab, $0 is the last place)

### vimwiki keymaps

- Enter -> follow link
- backspace -> go back
- <leader> ww -> open wiki index
- <leader> wt -> open wiki index file in new tab
- <leader> ws -> list and select available wikis
- <leader> wr -> rename wiki page 
- <leader> wd -> delete wiki page
- 
- <C-space> -> check/uncheck box
 
### vimwiki diary
- <leader> wi -> open diary index file for wiki
- <leader> w <leader> w -> open today's diary file for wiki
- <leader> w <leader> t -> open today's diary file for wiki in new tab 
- <C-up> -> open previous day's diary
- <C-down> -> open next day's diary

