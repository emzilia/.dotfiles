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
set shiftwidth=4
set autochdir

set expandtab
set tabstop=4
set shiftwidth=4

filetype plugin indent on

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

" reload vimrc
nnoremap <Leader>r :so ~/.vimrc<CR>
" load vim config for writing
nnoremap <Leader>W :so ~/.writerc<CR>
" edit .vimrc
nnoremap <Leader>V :tabnew<CR>:find ~/.vimrc<CR>

" venter toggle
nnoremap <Leader>v :VenterToggle<CR>
" format file with Prettier
nnoremap <Leader>P <Plug>(Prettier)

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

Plug 'jmckiern/vim-venter'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'javascript', 'typescript', 'python', 'rust',]}

Plug 'prettier/vim-prettier', {
	  \ 'do': 'yarn install --frozen-lockfile --production',
	    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

