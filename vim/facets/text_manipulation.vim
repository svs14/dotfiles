"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Text Manipulation Facet
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enables quick commenting
Bundle 'scrooloose/nerdcommenter'

" Manipulation of quotes, parentheses etc.
Bundle 'tpope/vim-surround'

" Manipulation of count methods in vim (e.g. <number>w)
Bundle 'Lokaltog/vim-easymotion'

" Automatically complete quotes, parentheses etc.
Bundle 'Raimondi/delimitMate' 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Text Manipulation Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Have tabs default to 2 spaces
set tabstop=2
set shiftwidth=2

" Make tabs become spaces
set expandtab

" Enable line numbers
set number

" Intelligently indent on new line
set autoindent

" Enable backspace over indentations, end-of-lines, start of inserts
set backspace=indent,eol,start

" Turn off physical line wrapping
set textwidth=0
set wrapmargin=0
