set laststatus=2

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
   let l:branchname = GitBranch()
   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

hi NormalColor guifg=Black guibg=Blue ctermbg=151 ctermfg=0
hi InsertColor guifg=Black guibg=Orange ctermbg=202 ctermfg=0
hi ReplaceColor guifg=Black guibg=Purple ctermbg=176 ctermfg=0
hi VisualColor guifg=Black guibg=Cyan ctermbg=38 ctermfg=0
hi BranchColor guifg=Black guibg=Cyan ctermbg=145 ctermfg=0
hi StatusLineColor guifg=Black guibg=Black ctermbg=0 ctermfg=255

function! GitBranch()
  return system("git -C ". expand("%:p:h") ." rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ --NORMAL--\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ --INSERT--\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ --REPLACE--\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ --VISUAL--\ ':''}
set statusline+=%#BranchColor#%{StatuslineGit()}
set statusline+=%#StatusLineColor#%f
set statusline+=%m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
