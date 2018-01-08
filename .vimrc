" ===== plugins ======
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible' "sane defaults for vim
Plug 'tpope/vim-endwise' "add end in ruby, vimscript, etc
Plug 'tpope/vim-eunuch'  "helpers for unix commands
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot' "colors for any language
Plug 'mhinz/vim-signify' "git info
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'alfredodeza/pytest.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wincent/ferret' "mutifile search
Plug 'wincent/terminus' " better paste, insert mode cursor, better mouse support
Plug 'millermedeiros/vim-esformatter', { 'do': 'npm install -g esformatter' }
Plug 'rodjek/vim-puppet'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'ekalinin/dockerfile.vim'

" Javascript:
" Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
" Plug 'gavocanov/vim-js-indent'

Plug 'ervandew/supertab'

"these plugins need setup outside vim
Plug 'marijnh/tern_for_vim', {'do': 'npm install' }
Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer' }

"Snipet engine:
"Plug 'SirVer/ultisnips'

" get fonts from: https://github.com/Lokaltog/powerline-fonts
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes:
Plug 'morhetz/gruvbox'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'ajh17/Spacegray.vim'

call plug#end()


" ======== MY CUSTOMIZATIONS =========
filetype on
syntax on
colorscheme spacegray

" yank to clipboard
set clipboard=unnamed

"numero da linha
set nu
set nuw=1
"busca enquanto digito
set incsearch
set hlsearch

"esconde o buffer ao inves de fechar. permite que vc tenha um arquivo nao
"salvo em outro buffer
set hidden

"Terraform:
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1

"NerdComment:
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"powerline customization
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"Leader:
let mapleader = ","

"Personalizacoes do NERDTree
let g:NERDTreeWinSize = 50
let NERDTreeIgnore = ['.*\.pyc$', '.*\.swp', 'node_modules']
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
nnoremap <leader>nn :execute 'NERDTreeToggle ' . getcwd()<CR>

"use eslint
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" use the local eslint
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'



"Snipets Options:
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
let g:syntastic_python_checkers = ['flake8']

set expandtab
set showmatch

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

nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)

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

"pytest
nnoremap <leader>m :Pytest method<CR>
nnoremap <leader>s :Pytest session<CR>

"mostra os buffers na status line
let g:airline#extensions#tabline#enabled = 1

"enable tern shortcuts
nnoremap <leader>td :TernDef<CR>
nnoremap <leader>tr :TernRefs<CR>

"esformatter shortcuts
nnoremap <silent> <leader>es :Esformatter<CR>
vnoremap <silent> <leader>es :EsformatterVisual<CR>
