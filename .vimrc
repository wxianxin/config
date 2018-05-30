" 20180124

" vim plugin installation
" mkdir ~/.vim
" cp autoload plugin blablabla to .vim
" All set!

" After installing a new help file into ~/.vim/doc, you need to rebuild the help tags file:  :helptags ~/.vim/doc
set cursorline
set nocompatible
set nu
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab
set showmatch
set hlsearch
set ignorecase
set smartcase
filetype indent on
syntax on

set foldmethod=syntax
let r_syntax_folding = 1

colorscheme molokai
let g:rehash256 = 1

map <F5> :w<CR>:!clear;python3 "%"<CR>
nnoremap <F2> :noh<CR><CR>
set pastetoggle=<F3>
nnoremap <F5> :set spell!<CR>
nnoremap <S-F5> ggvG= "shift <F5> to format code



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
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_python_pylint_args = '-d "C0103,W0621"'
" disable
" C0103, variable naming error
" W0621, redefine outer scope


" supertab installed


" NERDTree
" files
"  Autoload
"  Plugin
"  Doc
"  Lib/
"  Synatx/
"  nerdtree_plugin/   "NOT COPIED


" Taglist
" let Tlist_Auto_Open = 1
