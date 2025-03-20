" Yes

if &compatible
  set nocompatible
endif

syntax on
set number
set cursorline
set cursorcolumn
set showcmd
set statusline=%f%=%l,%c
set laststatus=2

" Make space the leader key
let mapleader = " "

" Leader key binds
" Remap Ctrl-w to Space+w		control-w modifier with spacebar
nnoremap <Leader>w <C-w>
" Remap Ctrl-w/Ctrl-q to Space+k	kill buffer
nnoremap <Leader>k <C-w><C-q>
" Remap :only to Space+o		close all buffers but focused one
nnoremap <Leader>o :on<CR>
" Remap :find to Space+f		:find a file or directory
nnoremap <Leader>f :find 
" Remap :Vexplore to Space+F		:Vexplore current dir
nnoremap <Leader>F :Ve<CR>
" Remap gt and gT to Space+h/Space+l	switch tabs with space+h/space+l
nnoremap <Leader>h gt
nnoremap <Leader>l gT
" Remap :Vexplore repos to Space+p	open :Vexplore on repos dir
nnoremap <Leader>p :Ve repos<CR>
" Remap :tabf to Space+t		create new empty tab
nnoremap <Leader>t :tabnew<CR>

" File exploration menu settings
 let g:netrw_banner = 0        " remove directions at top of file listing
 let g:netrw_liststyle=3       " tree style listing
 let g:netrw_browse_split =4   " split horizontal
 let g:netrw_altv = 1
 let g:netrw_winsize=20        " width of window
 let g:netrw_preview=1
 augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END

" Sudo write
ca w!! w !sudo tee >/dev/null "%"
