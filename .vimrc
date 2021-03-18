" .vimrc 20200713
" .vim/ 20200713

" TODO <leader>

" vim plugin installation
" mkdir ~/.vim/pack/foo/start ~/.vim/pack/foo/opt
" put plugin root folder into the directories
" All set!
" After installing a new help file into ~/.vim/doc, you need to rebuild the help tags file:  :helptags ~/.vim/doc
" NOTE: For ale and flake8 to work properly, install using `apt`, don't use `pip install`

" mkdir .vim/colors

" plugin list:
"~/.vim/pack/foo/start
"   ale
"   black
"   nerdtree
"   vim-airline
"   vim-fugitive
"   vim-gitgutter
"   Youcompleteme

"~/.vim/pack/foo/opt
"   supertab
"   syntastic

set showcmd
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
set colorcolumn=88
filetype indent on
syntax on

set foldmethod=indent
set foldlevel=1
set foldclose=all
"let r_syntax_folding = 1

colorscheme molokai
let g:rehash256 = 1

nnoremap <F2> :set nu! <CR>
nnoremap <F3> :ALEToggle <CR>
nnoremap <F4> :GitGutterToggle <CR>
nnoremap <S-F4> :GitGutterLineHighlightsToggle <CR>
nnoremap <F5> :w<CR> :!clear;python3 "%"<CR>
nnoremap <S-F5> :w<CR> :!clear;python3 -i "%"<CR>
nnoremap <F6> ggvG= <CR>
" <F6> to auto indent code
nnoremap <F6> :set spell!<CR>
set pastetoggle=<F7>
nnoremap <F9> :lprev<CR>
nnoremap <F10> :lnext<CR>
nnoremap <C-l> :noh<CR>
nnoremap <C-_> 0i#<Space><Esc>

" switch tabs
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-tab>   <Esc>:tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>
" the 4 lines above does not work for Mac



" airline
" if airline is not always showing
" set laststatus=2
" If there is a pause when leaving insert mode:
" set ttimeoutlen=50


" ale
let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_list_window_size = 8
let g:ale_linters = { 'python': ['flake8']}
let g:ale_python_flake8_options = '--ignore=C0103,W0621,E501,E303,W503,E203'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '❌'
" let g:ale_python_pylint_options = '-d "C0103,W0621"'
" disable
" C0103, variable naming error
" W0621, redefine outer scope
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
