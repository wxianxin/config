" 20180124

" vim plugin installation
" mkdir ~/.vim
" cp autoload plugin blablabla to .vim
" All set!

" After installing a new help file into ~/.vim/doc, you need to rebuild the help tags file:  :helptags ~/.vim/doc
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
" copied from internet
set pastetoggle=<F2>
nnoremap <F3> :noh<CR><CR>
nnoremap <F5> :set spell!<CR>
nnoremap <S-F5> ggvG= "shift <F5> to format code
nmap <tab> gt
nmap <s-tab> gT
"


" airline
" if airline is not always showing
set laststatus=2
" If there is a pause when leaving insert mode:
" set ttimeoutlen=50


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


" supertab installed


"NERDTree


" Taglist
" let Tlist_Auto_Open = 1
