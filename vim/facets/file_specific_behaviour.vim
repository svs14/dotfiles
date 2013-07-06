"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" File Specific Behaviour Facet
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create file-specific indentation behaviour
autocmd FileType make set noexpandtab
autocmd FileType c set cindent
autocmd FileType haskell set ts=2
autocmd FileType haskell set sw=2
autocmd FileType ruby set ts=2
autocmd FileType ruby set sw=2
