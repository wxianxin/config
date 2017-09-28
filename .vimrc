set nocompatible
set nu
set cursorline
filetype indent on
set smartindent
set shiftwidth=4
set expandtab
set showmatch
set hlsearch
syntax on
set softtabstop=4
set ignorecase
set smartcase
set hlsearch

colorscheme molokai

map <F5> :w<CR>:!clear;python3 "%"<CR>

"Install plugin
"mkdir ~/.vim
"cp autoload plugin blablabla to .vim
"All set!

"NERDTree

"syntastic
" install pep8 for python3
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11'

" Taglist
" let Tlist_Auto_Open = 1
