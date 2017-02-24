" ===== plugins ======
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible' "sane defaults for vim
Plug 'tpope/vim-endwise' "add end in ruby, vimscript, etc
Plug 'tpope/vim-eunuch'  "helpers for unix commands
Plug 'sheerun/vim-polyglot' "colors for any language
Plug 'mhinz/vim-signify' "git info
Plug 'scrooloose/syntastic'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'alfredodeza/pytest.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mxw/vim-jsx' "react
Plug 'elzr/vim-json' "jso n
Plug 'othree/javascript-libraries-syntax.vim' "syntax for various libraries
Plug 'wincent/ferret' "mutifile search
Plug 'wincent/terminus' " better paste, insert mode cursor, better mouse support

"these plugins need setup outside vim
Plug 'marijnh/tern_for_vim', {'do': 'npm install' }
Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer' }

" get fonts from: https://github.com/Lokaltog/powerline-fonts
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes:
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()

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

"esconde o buffer ao inves de fechar. permite que vc tenha um arquivo nao
"salvo em outro buffer
set hidden

"leader key
let mapleader = ","

"Personalizacoes do NERDTree
let g:NERDTreeWinSize = 50
let NERDTreeIgnore = ['.*\.pyc$', '.*\.swp', 'node_modules']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
nnoremap <leader>nn :execute 'NERDTreeToggle ' . getcwd()<CR>

"syntastic config

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"use eslint
let g:syntastic_javascript_checkers = ['eslint']
" use the local eslint
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set expandtab
"set tab preferences for javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"';;' adds a ';' to the end
autocmd Filetype javascript inoremap ;; <C-o>A;

"map para git status - precisa do vim-fugitive
nmap <leader>gs :Gstatus<CR>
nmap <leader>gu :Git pull --rebase<CR>
nmap <leader>gp :Git push<CR>

"clear search with enter
nnoremap <silent> <CR> :let @/=""<CR>

"edit vimrc file
nnoremap <leader>vim :e ~/.vim/.vimrc<CR>


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

"maps fzf to C-t
nnoremap <C-t> :FZF<CR>

" Easy window navigation
noremap <C-h> <C-w>h
if has('nvim')
     nmap <BS> <C-W>h
endif
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"mostra os buffers na status line
let g:airline#extensions#tabline#enabled = 1

"enable tern shortcuts
nnoremap <leader>td :TernDef<CR>
nnoremap <leader>tr :TernRefs<CR>

"reload vim config on save
autocmd bufwritepost .vimrc source ~/.vimrc
