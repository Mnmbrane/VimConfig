" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
"nnoremap <silent> <C-p> :Files<cr>

let g:fzf_buffers_jump = 1
" Function to prevent FZF commands from opening in functional buffers
"
" See: https://github.com/junegunn/fzf/issues/453
" TODO: Remove once this workaround is no longer necessary.

function! FZFOpen(cmd)
    " Define the functional buffer types that we want to not clobber
    let functional_buf_types = ['quickfix', 'help', 'nofile', 'terminal']

    " If more than 1 window, and buffer type is not one of the functional types
    if winnr('$') > 1 && (index(functional_buf_types, &bt) >= 0)
        " Find all 'normal' (not functional) buffer windows
        let norm_wins = filter(range(1, winnr('$')),
                    \ 'index(functional_buf_types, getbufvar(winbufnr(v:val), "&bt")) == -1')

        " Grab the first one that we can use
        let norm_win = !empty(norm_wins) ? norm_wins[0] : 0

        " Move to that window
        exe norm_win . 'winc w'
    endif

    " Execute the passed command
    exe a:cmd
endfunction

" Map CTRL+P to FZF
nnoremap <C-P> :call FZFOpen(':FZF')<CR>
