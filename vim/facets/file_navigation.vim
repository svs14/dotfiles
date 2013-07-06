"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" File Navigation Facet
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" File Explorer
Bundle 'scrooloose/nerdtree'

" Buffer explorer (open file tab)
Bundle 'fholgado/minibufexpl.vim'

" Closing of buffers without closing the window
Bundle 'vim-scripts/bufkill.vim'

" Can now do `vim sudo:file.txt`
Bundle "vim-scripts/sudo.vim"

" Fuzzy finding of files, buffers, mru, tags, ...
Bundle "kien/ctrlp.vim"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Intelligently figure out what starting directory CtrlP is in
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap tab key to toggle NERD tree in normal mode
nnoremap <tab> :NERDTreeToggle<cr> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExpl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix MiniBufExpl title
fun! FixMiniBufExplorerTitle()
    if "-MiniBufExplorer-" == bufname("%")
        setlocal statusline=--
    endif
endfun
au BufWinEnter *
            \ let oldwinnr=winnr() |
            \ windo call FixMiniBufExplorerTitle() |
            \ exec oldwinnr . " wincmd w"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Navigation Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffers are hidden when abandoned
set hidden

" Fast buffer mappings
map <c-right> <Esc>:bn<cr>
map <c-left> <Esc>:bp<cr>
map <c-l> <Esc>:bn<cr>
map <c-h> <Esc>:bp<cr>
map <s-right> <Esc>:tabn<cr>
map <s-left> <Esc>:tabp<cr>

" Enable navigation around soft wraps
noremap j gj
noremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Folding Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldenable
nnoremap <space> za
vnoremap <space> zf
set foldcolumn=0
