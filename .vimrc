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
"set termwinsize=12x0
set autochdir

set noexpandtab
set tabstop=4
set shiftwidth=4

filetype plugin indent on

function Set_cindenting()
	setlocal tabstop=8
	setlocal shiftwidth=8
endfunction

function Set_shindenting()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction

autocmd Filetype c call Set_cindenting()
autocmd Filetype h call Set_cindenting()
autocmd Filetype sh call Set_shindenting()

" Make space the leader key
let mapleader = " "

" Leader key binds
" control-w modifier with spacebar
nnoremap <Leader>w <C-w>
" kill buffer
nnoremap <Leader>k <C-w><C-q>
" super kill buffer
nnoremap <Leader>K :q!<CR>
" close all buffers but focused one
nnoremap <Leader>o :on<CR>
" :find a file or directory
nnoremap <Leader>F :find 
" :Vexplore current dir
nnoremap <Leader>f :Vex<CR>
" switch tabs with space+h/space+l
nnoremap <Leader>h gt
nnoremap <Leader>l gT
" switch panes with space+H/space+L
nnoremap <Leader>H <C-w>h
nnoremap <Leader>L <C-w>l

" open :Vexplore on repos dir
nnoremap <Leader>p :Vex $HOME/repos<CR>
" create new empty tab
nnoremap <Leader>t :tabnew<CR>
" create new terminal buffer in bottom		
nnoremap <Leader>S :botright term ++rows=12 ++cols=0<CR>
" split screen vertically
nnoremap <Leader>s :vsplit<CR>
" create new terminal buffer in new tab
nnoremap <Leader>q :tab term<CR>

" compile rust package in terminal buffer
nnoremap <Leader>c :botright term cargo run<CR>
" same thing but for python
nnoremap <Leader>x :botright term python3 %<CR>
" compile go package
nnoremap <Leader>G :! clear; go run .<CR>

" reload vimrc
nnoremap <Leader>r :so ~/.vimrc<CR>
" load vim config for writing
nnoremap <Leader>W :so ~/.writerc<CR>
" edit .vimrc
nnoremap <Leader>V :tabnew<CR>:find ~/.vimrc<CR>

" fix netrw size
nnoremap <Leader>v :vertical resize 20<CR>

" format file with Prettier
nnoremap <Leader>P <Plug>(Prettier)

" insert date
nnoremap <F3> "=strftime('%Y-%m-%d')<CR>P

" File exploration menu settings
 let g:netrw_banner = 0        " remove directions at top of file listing
 let g:netrw_liststyle=3       " tree style listing
 let g:netrw_browse_split =4   " split horizontal
 let g:netrw_altv = 1
 let g:netrw_winsize=14        " width of window
 let g:netrw_preview=1

" IndentLine plugin char
let g:indentLine_char = '│'
set list lcs=tab:\│\ 

" Line number color
hi LineNr ctermfg=Red

" Coc plugin coloring
hi CocInlayHint ctermfg=White ctermbg=Red
hi CocFloating ctermfg=Grey ctermbg=Black
hi CocHintHighlight ctermbg=White ctermfg=Brown

" Sudo write
ca w!! w !sudo tee >/dev/null "%"

let g:prettier#config#trailing_comma = 'all'

let g:venter_width = '18'

call plug#begin()

Plug 'neoclide/coc.nvim', {
      \ 'branch': 'release', 
	    \ 'for': ['json', 'c', 'go', 'cs', 'javascript', 'kotlin', 'typescript', 'python', 'rust',]}

Plug 'prettier/vim-prettier', {
	  \ 'do': 'yarn install --frozen-lockfile --production',
	    \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'yaml', 'html']}

Plug 'Yggdroot/indentLine'

" colorscheme
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

" Colorscheme
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
