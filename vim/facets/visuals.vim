"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Visuals Facet
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nice status line
Bundle 'Lokaltog/vim-powerline'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set background color
set background=light

" Color column that goes beyond textwidth
if exists('+colorcolumn')
    set textwidth=80
    set colorcolumn=+1
else
    match ErrorMsg /\%>79v.\+/
endif

" Show statusline in each window
set laststatus=2

" Set syntax highlighting on
syntax on
