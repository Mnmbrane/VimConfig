"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=UTF-8

set rtp+=~/.fzf

set hidden

set modifiable

set tabstop=3

" Fold manually
set foldmethod=manual

" If you have vim-airline, you can also enable the provided theme
colorscheme codedark

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file in use.
" Enable plugins and load plugin for the detected file type.
" Load an indent file for the detected file type.
filetype plugin indent on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Turn on relative numbers
set number relativenumber

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.jpg,*.png,*.gif,*.bmp,*.tiff,*.psd,*.img,        "Images
              \*.mp4,*.mkv,*.avi,*.mov,*.mpg,*.vob,*.flv          "Videos
              \*.mp3,*.aac,*.wav,*.flac,*.ogg,*.mka,*.wma,        "Audio
              \*.pdf,*.doc,*.xls,*.ppt,*.docx,*.odt,              "Documents
              \*.zip,*.rar,*.7z,*.tar,*.gz,                       "Archive
              \*.mdb,*accde,*.frm,*.sqlite,                       "Database
              \*.exe,*.dll,*.so,*.class,*.a,*.o,*.lib             "Executable

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

set list listchars=eol:¬,tab:→\ ,trail:~,extends:>,precedes:<,space:·

" Resize window width easily
nmap          <C-W>>     <C-W>><SID>ws
nmap          <C-W><     <C-W><<SID>ws
nn <script>   <SID>ws>   <C-W>><SID>ws
nn <script>   <SID>ws<   <C-W><<SID>ws
nmap          <SID>ws    <Nop>

" PageUp or PageDown keys for buffer
nnoremap <silent> <leader>h :bprevious<CR>
nnoremap <silent> <leader>l :bnext<CR>

" Add a cursor line when entering
"autocmd InsertEnter,InsertLeave * set cul!

" Rename tmux windows
"autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

" Automatic saving
" au InsertLeave,TextChanged * if &readonly == 0 && filereadable(bufname('%')) | silent write | endif

" Turn relative numbers on or off based on where the focus is
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" Turn syntax highlighting on.
syntax on

highlight SpecialKey ctermfg=240 ctermbg=none

source ~/.vim/init.vim
