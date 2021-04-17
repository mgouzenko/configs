" Plugins {{{
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'vim-scripts/ScrollColors'
Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ntpeters/vim-better-whitespace'
Plug 'haya14busa/incsearch.vim'
Plug 'SirVer/ultisnips'
call plug#end()
" }}}

" SirVer/ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-]>"
let g:UltiSnipsJumpForwardTrigger="<c-]>"
let g:UltiSnipsJumpBackwardTrigger="<c-[>"
" }}}

" flazz/vim-colorschemes {{{
let g:neodark#solid_vertsplit = 1
colorscheme neodark
" }}}

" haya14busa/incsearch.vim {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}

" kien/rainbow_parentheses.vim {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['red',         'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['gray',        'firebrick3']
    \ ]
" }}}

" Yggdroot/indentLine {{{
let g:indentLine_char = '│'
" }}}

" easymotion/vim-easymotion {{{
nmap F <Plug>(easymotion-overwin-line)
nmap f <Plug>(easymotion-bd-w)
" }}}

" Misc Key Bindings {{{
inoremap jk <ESC>

" Move visually (instead of by line number)
nnoremap j gj
nnoremap k gk

" Ctrl-hjkl to move around windows
nnoremap <silent> <c-h> :wincmd h <CR>
noremap <silent> <c-j> :wincmd j <CR>
noremap <silent> <c-k> :wincmd k <CR>
nnoremap <silent> <c-l> :wincmd l <CR>

" Emacs-style ctrl-a and ctrl-e to get to the beginning and end of line.
inoremap <c-a> <Esc>^i
inoremap <c-e> <Esc>A

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Move code blocks up and down visually
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
" }}}

" Misc {{{
set nocompatible
set autoindent
set tabstop=8
set softtabstop=4
set expandtab
set shiftwidth=4
set backspace=2
set encoding=utf-8
set sidescrolloff=15
set sidescroll=1
set scrolloff=8         " Start scrolling when we're 8 lines away from margins
set nowrap              " Don't wrap long lines (you have to scroll to see them)
set number              " Line numbers
set relativenumber      " Line numbers are relative
set undofile            " Maintain undo history between sessions
set modelines=1         " Allows variable fold settings for specific files
set cursorline          " Highlight the current line.
set foldlevelstart=100  " Fold 100 levels in (disabling folding by default)
set foldmethod=indent   " Folds are based on indents
set colorcolumn=81      " Vertical line at 81 characters

" https://vi.stackexchange.com/questions/10124
filetype plugin indent on

" Set 'textwidth' to 80 characters.
au FileType text,python,c,cc setlocal textwidth=80

" Autoformat text
au FileType text setlocal formatoptions+=tn
au FileType python,c,java setlocal formatoptions=qrjcb

" When editing a file, always jump to the last known cursor position.  Don't
" do it when the position is invalid or when inside an event handler (happens
" when dropping a file on gvim). Also don't do it when the mark is in the
" first line.  that is the default position when opening a file.
autocmd BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
" }}}
" vim:foldmethod=marker:foldlevel=0
