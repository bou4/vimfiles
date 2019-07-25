highlight clear

if exists('syntax_on')
    syntax reset
endif

" Load Dracula
runtime colors/dracula.vim

" Override the name of the base color scheme
let g:colors_name = 'dracula_custom'

highlight! link VertSplit DraculaFg

