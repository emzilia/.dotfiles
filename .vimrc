" Yes

if &compatible
  set nocompatible
endif

syntax on
set number
set cursorline
set showcmd
set statusline=%f%=%l,%c
set laststatus=2
set termwinsize=8x0
set ts=4
set shiftwidth=4

filetype plugin indent on

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
nnoremap <Leader>p :Ve $HOME/repos<CR>
" Remap :tabf to Space+t		create new empty tab
nnoremap <Leader>t :tabnew<CR>
" Remap :botright term to Space+s	create new terminal buffer in bottom		
nnoremap <Leader>s :botright term<CR>
" Remap :so ~/.vimrc to Space+r		reload vimrc
nnoremap <Leader>r :so ~/.vimrc<CR>
" Remap :so ~/.writerrc to Space+W	load vim config for writing
nnoremap <Leader>W :so ~/.writerc<CR>
" Remap for Prettier				format file with Prettier
nnoremap <Leader>P <Plug>(Prettier)

" File exploration menu settings
 let g:netrw_banner = 0        " remove directions at top of file listing
 let g:netrw_liststyle=3       " tree style listing
 let g:netrw_browse_split =4   " split horizontal
 let g:netrw_altv = 1
 let g:netrw_winsize=20        " width of window
 let g:netrw_preview=1

" Sudo write
ca w!! w !sudo tee >/dev/null "%"

let g:prettier#config#trailing_comma = 'all'

autocmd BufNew,BufEnter *.js,*.ts,*.json,*.vim,*.lua execute "silent! CocEnable"
autocmd BufLeave *.js,*.ts,*.json,*.vim,*.lua execute "silent! CocDisable"

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'javascript', 'typescript', 'lua', ]}
Plug 'prettier/vim-prettier', {
	  \ 'do': 'yarn install --frozen-lockfile --production',
	    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()
