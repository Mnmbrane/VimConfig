let g:fern#default_hidden=1

function! s:init_fern() abort
	" Write custom code here
	setlocal statusline=%#EndOfBuffer#
	nmap <buffer><silent><c-k> :TmuxNavigateUp<cr>
	nmap <buffer><silent><c-j> :TmuxNavigateDown<cr>
	nmap <buffer><silent><c-h> :TmuxNavigateLeft<cr>
	nmap <buffer><silent><c-l> :TmuxNavigateRight<cr>
	nmap <buffer><silent><c-r> <Plug>(fern-action-reload:all)<cr>
	nmap <buffer> H <Plug>(fern-action-open:split)
	nmap <buffer> V <Plug>(fern-action-open:vsplit)
	nmap <buffer> R <Plug>(fern-action-rename)
	nmap <buffer> M <Plug>(fern-action-move)
	nmap <buffer> C <Plug>(fern-action-copy)
	nmap <buffer> N <Plug>(fern-action-new-path)
	nmap <buffer> T <Plug>(fern-action-new-file)
	nmap <buffer> D <Plug>(fern-action-new-dir)
	nmap <buffer> S <Plug>(fern-action-hidden-toggle)
	nmap <buffer> dd <Plug>(fern-action-remove)
	nmap <buffer> <leader> <Plug>(fern-action-mark)
endfunction

augroup my-fern
	autocmd! *
	autocmd FileType fern call s:init_fern()
augroup END

let s:toggle=0
function! FernToggle()
	:Fern . -drawer -toggle -width=35
	:vertical resize 35
endfunction

nnoremap <silent> <leader>n :call FernToggle()<cr>

