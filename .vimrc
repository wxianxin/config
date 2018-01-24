" 20180124
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
let g:rehash256 = 1

map <F5> :w<CR>:!clear;python3 "%"<CR>

" vim plugin installation
" mkdir ~/.vim
" cp autoload plugin blablabla to .vim
" All set!

" airline installed

" syntastic
" sudo apt install pylint3; NOT pip3 install pylint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11'


"NERDTree

" Taglist
" let Tlist_Auto_Open = 1
