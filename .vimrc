" yes

if &compatible
  set nocompatible
endif

syntax on
set number
set cursorline
set cursorcolumn
set showcmd

" Make space the leader key
let mapleader = " "

" Leader key binds
" Remap Ctrl-w to Space+w
nnoremap <Leader>w <C-w>
" Remap Ctrl-w/Ctrl-q to Space+q
nnoremap <Leader>q <C-w><C-q>
" Remap :only to Space+o
nnoremap <Leader>o :on<CR>
" Remap :find to Space+f
nnoremap <Leader>f :find 
" Remap :Vexplore to Space+F
nnoremap <Leader>F :Ve<CR>
" Remap gt and gT to Space+h/Space+l
nnoremap <Leader>h gt
nnoremap <Leader>l gT
" Remap :Vexplore repos to Space+p
nnoremap <Leader>p :Ve repos<CR>

"  file exploration menu settings
 let g:netrw_banner = 0        " remove directions at top of file listing
 let g:netrw_liststyle=3       " tree style listing
 let g:netrw_browse_split =4   " split horizontal
 let g:netrw_altv = 1
 let g:netrw_winsize=25        " width of window
 let g:netrw_preview=1
 augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END

"  sudo write
ca w!! w !sudo tee >/dev/null "%"
