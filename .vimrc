" ========= START VUNDLE INSTALLATION ==========
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'alfredodeza/pytest.vim'
Plugin 'michaeljsmith/vim-indent-object'

" get fonts from: https://github.com/Lokaltog/powerline-fonts
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Themes:
Plugin 'morhetz/gruvbox'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'chriskempson/vim-tomorrow-theme'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ======== END VUNDLE INSTALLATION =========

" ======== MY CUSTOMIZATIONS =========
filetype on
syntax on
colorscheme Tomorrow-Night

"numero da linha
set nu
set nuw=1

"powerline customization
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"busca enquanto digito
set incsearch
set hlsearch

"leader key
let mapleader = ","

"Personalizacoes do NERDTree
let g:NERDTreeWinSize = 50
let NERDTreeIgnore = ['.*\.pyc$', '.*\.swp']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
nnoremap <leader>nn :execute 'NERDTreeToggle ' . getcwd()<CR>

"map para git status - precisa do vim-fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gu :Git pull --rebase<CR>
nmap <leader>gp :Git push<CR>

"esconde o buffer ao inves de fechar. permite que vc tenha um arquivo nao
"salvo em outro buffer
set hidden

"navegacao buffers
nmap <tab> :bn<CR>
nmap <s-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>q <c-w>q

"mover texto
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>gi
inoremap <C-Up> <Esc>:m-2<CR>gi
vnoremap <C-Down> :m'>+<CR>gv
vnoremap <C-Up> :m-2<CR>gv

nnoremap <C-Left> <<
nnoremap <C-Right> >>
vnoremap <C-Left> <gv
vnoremap <C-Right> >gv

"shows matching block delimiters
set showmatch
set matchtime=5

"sem os beeps malditos
set visualbell
set noerrorbells

"sem backup inutil
set nobackup
set noswapfile

"fast command mode
nnoremap ; :

"corrige o maldito j quando a linha eh grande e ocupa duas linhas do editor
nnoremap j gj
nnoremap k gk

" Easy window navigation
noremap <C-h> <C-w>h
if has('nvim')
     nmap <BS> <C-W>h
endif
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"fzf
noremap <C-t> :FZF<CR>

"mostra os buffers na status line
let g:airline#extensions#tabline#enabled = 1

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
