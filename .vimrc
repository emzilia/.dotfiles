" yes

if &compatible
  set nocompatible
endif

syntax on
set number
set cursorline
set cursorcolumn

"  file exploration menu settings
 let g:netrw_banner = 0        " remove directions at top of file listing
 let g:netrw_liststyle=3       " tree style listing
 let g:netrw_browse_split = 3  " split horizontal
 let g:netrw_altv = 1
 let g:netrw_winsize=25        " width of window
 let g:netrw_preview=1
 augroup ProjectDrawer autocmd!  autocmd VimEnter * :Vexplore augroup END

"  sudo write
ca w!! w !sudo tee >/dev/null "%"

call plug#begin('~/.vim/autoload')

Plug 'theacodes/witchhazel'

call plug#end()

colorscheme witchhazel
