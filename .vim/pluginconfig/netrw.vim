set nocp
set hidden
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_keepdir = 0

noremap <silent> <leader>n :Lexplore<CR>

function! s:rmdir()
   let l:flist = netrw#Expose('netrwmarkfilelist')
   if l:flist is# 'n/a'
      " no selection -- get name under cursor
       let l:flist = [b:netrw_curdir . '/' . netrw#GX()]
   else
      " remove selection as files will be deleted soon
      call netrw#Call('NetrwUnmarkAll')
   endif

   let name = l:flist[0]
   if input('delete '.name.' ? (y/n)') ==# 'y'
      if !delete(name,'rf')
         if search('^\.\/$','Wb')
            exe "norm \<cr>"
         endif
      endif
   endif
endfunction
command! RmNetrw call <SID>rmdir()

"func! SN(script_name)
"    " Return the <SNR> of a script.
"    "
"    " Args:
"    "   script_name : (str) The name of a sourced script.
"    "
"    " Return:
"    "   (int) The <SNR> of the script; if the script isn't found, -1.
"
"    redir => scriptnames
"    silent! scriptnames
"    redir END
"
"    for script in split(l:scriptnames, "\n")
"        if l:script =~ a:script_name
"            return str2nr(split(l:script, ":")[0])
"        endif
"    endfor
"
"    return -1
"endfunc

"command! Refresh call eval(printf("\<SNR\>%d_NetrwRefresh(1,\<SNR\>%d_NetrwBrowseChgDir(1,(exists(\"w:netrw_liststyle\") && exists(\"w:netrw_treetop\") && w:netrw_liststyle == 3)? w:netrw_treetop : './'))", SN("netrw.vim"), SN("netrw.vim")))
augroup FiletypeSpecificMappings
   au FileType netrw noremap <silent> <buffer> <C-j> :<C-U>TmuxNavigateDown<CR>
   au FileType netrw noremap <silent> <buffer> <C-k> :<C-U>TmuxNavigateUp<CR>
   au FileType netrw noremap <silent> <buffer> <C-h> :<C-U>TmuxNavigateLeft<CR>
   au FileType netrw noremap <silent> <buffer> <C-l> :<C-U>TmuxNavigateRight<CR>
   au FileType netrw noremap <silent> <buffer> <C-p> <C-w><C-w>:FZF<CR>
   au FileType netrw noremap <silent> <buffer> <c-r> <NOP>
   au FileType netrw noremap <silent> <buffer> i <NOP>
   au FileType netrw noremap <silent> <buffer> I <NOP>
   au FileType netrw noremap <silent> <buffer> p <NOP>
   au FileType netrw noremap <silent> <buffer> P <NOP>
   au FileType netrw noremap <silent> <buffer> <PageUp> <NOP>
   au FileType netrw noremap <silent> <buffer> <PageDown> <NOP>
   au FileType netrw noremap <silent> <buffer> <leader>h <NOP>
   au FileType netrw noremap <silent> <buffer> <leader>l <NOP>
   au FileType netrw noremap <silent> <buffer> D :RmNetrw<CR>
   "au FileType netrw noremap <silent> <buffer> <nowait> <c-r> :Refresh<cr>
   au FileType netrw setlocal statusline=%#EndOfBuffer#
   "au FileType netrw setlocal listchars&
   "au FileType netrw setlocal listchars=eol:¬
   au FileType netrw setlocal norelativenumber nonumber
   au FileType netrw setlocal nocursorcolumn
augroup END


