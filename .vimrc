" 20180619

" vim plugin installation
" mkdir ~/.vim/pack/foo/start ~/.vim/pack/foo/opt
" put plugin root folder into the directories
" All set!
" After installing a new help file into ~/.vim/doc, you need to rebuild the help tags file:  :helptags ~/.vim/doc

" mkdir .vim/colors

" plugin list:
"~/.vim/pack/foo/start
"   ale
"   vim-airline
"   vim-fugitive
"   nerdtree
"   Youcompleteme

"~/.vim/pack/foo/opt
"   supertab
"   syntastic

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
nnoremap <F4> :set spell!<CR>
nnoremap <S-F4> ggvG= "shift <F5> to format code


" airline
" if airline is not always showing
" set laststatus=2
" If there is a pause when leaving insert mode:
" set ttimeoutlen=50


" ale
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = ''
let g:ale_lint_on_enter = 1
let g:ale_list_window_size = 8
let g:ale_python_pylint_options = '-d "C0103,W0621"'
" disable
" C0103, variable naming error
" W0621, redefine outer scope
let g:ale_sign_warning = '⚕️'
" ⚕️🚧
let g:ale_sign_error = '❌'
" hi link ALEWarningSign WarningMsg
hi ALEWarningSign ctermfg=11 ctermbg=235 guifg=#ED6237 guibg=#232526
" hi link ALEErrorSign Error
hi ALEErrorSign ctermfg=9 ctermbg=235


" NERDTree
map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" retired


" syntastic
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


" Taglist
" let Tlist_Auto_Open = 1
