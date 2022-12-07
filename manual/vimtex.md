# VimTex

## Spelling

* set spell
* set spelllang=de

* [s search forwards for wrong spelled words
* ]s search backwards for wrong spelled words

* zg add word  under cursor as correctly spelled into spellfile
* zug undo zg

* zw add word under cursor as wrongly spelled into spellfile
* zuw undo zw

* z= list correct suggesions

* [[Disable File for differenet filetypes]]
* autocmd FileType python setlocal nospell 

## Formating

* filetype plugin on
* fileau BufEnter *.tex set autowrite

* let g:Tex_DefaultTargetFormat = 'pdf'
* let g:Tex_MultipleCompileFormats = 'pdf'
* let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
* let g:Tex_GotoError = 0
* let g:Tex_ViewRule_pdf = 'evince'type indent on



