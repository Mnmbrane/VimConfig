let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""
let g:NERDTreeShowHidden=1
let g:NERDTreeStatusline = '%#NonText#'
au BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') != '' && bufname('%') !~ 'NERD_tree' && winnr('$') > 1 | b# | wincmd w | blast | endif
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <leader>n :NERDTreeMirror<CR>:NERDTreeToggle<CR>
nnoremap ,n :NERDTreeFind<CR>
