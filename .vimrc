set nocompatible              " be iMproved, required
filetype off                  " required

" Load `Plug` plugin manager
call plug#begin('$HOME/.vim/plug')

" Color schemes
Plug 'altercation/vim-colors-solarized'

" Files
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'troydm/zoomwintab.vim'
Plug 'lifepillar/vim-mucomplete'
Plug 'vim-scripts/YankRing.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'mrtazz/simplenote.vim'

" Documentation look-up
if has('mac')
  Plug 'rizzatti/dash.vim'
elseif has('unix')
  Plug 'KabbAmine/zeavim.vim'
endif

" Vim frontend for the Perl module `Ack` or `rg`. Replacements for `grep`.
if executable('ack')
  Plug 'mileszs/ack.vim'
elseif executable('rg')
  Plug 'mileszs/ack.vim'
endif

Plug 'kshenoy/vim-signature'

" Web development
Plug 'othree/html5.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
" HAML, SASS, and SCSS
Plug 'tpope/vim-haml'

" Markdown
Plug 'tpope/vim-markdown'

" Edit files using sudo/su
Plug 'chrisbra/SudoEdit.vim'

" <Tab> everything!
Plug 'ervandew/supertab'

" Fuzzy finder (files, mru, etc)
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'wincent/command-t'

" A pretty statusline, bufferline integration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autoclose (, " etc
" Regrettably vim-autoclose collides with the keyboard <Up> used with YCM,
" but that can be fixed with the `AutoClosePreservDotReg` setting below.
Plug 'Townk/vim-autoclose'

" Snippets like textmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" A fancy start screen, shows MRU etc.
Plug 'mhinz/vim-startify'

" Syntax checker
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Swift programming language syntax high-lighting and indentation
Plug 'keith/swift.vim'

" Python PEP8 checking (pip install flake8)
Plug 'nvie/vim-flake8'

" BadWhitespace
Plug 'bitc/vim-bad-whitespace'

" Initialize plugin system
call plug#end()            " required

" Options for airline
" Set font option for airline
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Options for CtrlP to show dotfiles
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'rc'

" Options for ALE linter
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'c': ['clang-format'],
\}

" Options for `simplenote`
source $HOME/.simplenotevimrc
let g:SimplenoteSortOrder = "pinned, modifydate"
let g:SimplenoteFiletype = "txt"
" let g:SimplenoteListHeight = 10
let g:SimplenoteSingleWindow = 1
map <F4> :SimplenoteList<CR>
nnoremap <Leader>nn :SimplenoteNew<CR>

" Options for `ZoomWinTab`
map <C-Bslash> :ZoomWinTabToggle<CR>

" Options for Vim
set wrap
set noswapfile
set wildmode=list:longest,full
set wildmenu
set hlsearch
set incsearch                  " show search matches as you type
set mouse=a
set lazyredraw                 " Increase scrolling performance
set ttyfast                    " Optimisation for terms
" set cursorline                 " highlight cursor line
set more                       " ---more--- like less
set number                     " line numbers
set norelativenumber           " no relative line numbers
set scrolloff=3                " lines above/below cursor
set showcmd                    " show cmds being typed
set title                      " window title
set history=1000               " default 20
set iskeyword+=_,$,@,%,#       " not word dividers
set laststatus=2               " always show statusline
set linebreak
" Tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
" Indentation
set autoindent
set smartindent
" set list listchars=tab:→·,trail:·,eol:¶
set list listchars=tab:→·,trail:·
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Clear TTY after exiting Vim
" au VimLeave * :!clear

" Remap colon to semi-colon
nnoremap ; :

" Solarized and terminfo preferences
syntax enable
set background=dark
let g:solarized_visibility = "normal"
" let g:solarized_termtrans=1
colorscheme solarized
highlight Comment cterm=italic

" Folding
set foldmethod=indent
set foldlevelstart=99
" let javaScript_fold=1         " JavaScript
" let perl_fold=1               " Perl
" let php_folding=1             " PHP
" let r_syntax_folding=1        " R
" let ruby_fold=1               " Ruby
" let sh_fold_enabled=1         " sh
" let vimsyn_folding='af'       " Vim script
" let xml_syntax_folding=1      " XML

" Store `.viminfo` files in `.vim` folder
set viminfo+=n~/.vim/.viminfo

" Mapleader mappings
let mapleader = ","

" Buffer wipe
map <Leader>w :bw<CR>

" Hide the current search highlights
map <Leader>s :noh<CR>

" mucomplete
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

" UltiSnips trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Tcomment toggle
map <Leader>c :TComment<CR>

" Function to toggle absolute and relative line-numbers
map <Leader>n :set relativenumber!<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Documentation look-up
if has('mac')
  nmap <silent> <Leader>d <Plug>DashSearch
elseif has('unix')
  let g:zv_disable_mapping = 1
  nmap <Leader>d <Plug>Zeavim                   " <Leader>d (NORMAL mode)
  vmap <Leader>d <Plug>ZVVisSelection           " <Leader>d (VISUAL mode)
  nmap <Leader>D <Plug>ZVKeyword                " <Leader>D
  nmap <Leader><Leader>d <Plug>ZVKeyDocset      " <Leader><Leader>d
endif

" `Tabular` mappings
if exists(":Tabularize")
  nmap <Leader>a= :Tab /=<CR>
  vmap <Leader>a= :Tab /=<CR>
  nmap <Leader>a: :Tab /:\zs<CR>
  vmap <Leader>a: :Tab /:\zs<CR>
endif

" Set option to make `Twonk/autoclose` work with arrow-up.
if !has("gui_running")
  let g:AutoClosePreservDotReg = 0
endif

" Add <angular brackets> to `Twonk/autoclose`.
let g:AutoClosePairs_add = "<>"

" Use `rg` instead of `grep` and instead of `ack` in the `ack.vim` plugin.
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Options for Vala plugin (https://wiki.gnome.org/Projects/Vala/Vim)
" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1
" Enable comment strings
let vala_comment_strings = 1
" Highlight space errors
let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
let vala_no_tab_space_error = 1
" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

" Set instant time-out for Esc-key (Meta).
" `timeoutlen` is used for mapping delays, 
" and `ttimeoutlen` is used for key code delays.
set timeoutlen=1000 ttimeoutlen=0

" Buffer cycling
nnoremap <F5> :buffers<CR>:buffer<Space>

" Move between open buffers
set hidden
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>

" Re-format indentation for the whole buffer
map <F7> mzgg=G`z

" NerdTree
let NERDTreeShowHidden=1
map <F8> :NERDTreeToggle<CR>
map <Leader>t :NERDTreeToggle<CR>

" Show the YankRing buffer
nnoremap <silent> <F6> :YRShow<CR>
nnoremap <silent> <Leader>y :YRShow<CR>

" Yank the search pattern to the yankring with `y/`
nnoremap <silent> y/ :let @"=@/<CR>

" Yank the search pattern to the system clipboard with `y*`
" nnoremap <silent> y/ :let @*=@/<CR>

" Map <kj> to enter normal mode.
imap kj <Esc>

" Insert empty lines with ]<Space> and [<Space> without entering insert mode
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" Save file with <C-s> shortcut
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" New tab
map <C-t> <esc>:tabnew<CR>
" Close tab
map <C-x> <C-w>c

" Close all buffers without saving using QQ
map <S-Q><S-Q> :qa!<CR>

" Save as sudo using `:W`
" command W w !sudo tee % > /dev/null

" Render terminal window title-string
" set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}\ hostname()
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:p:h\")})%)%(\ %a%)\ %{$USER}@%{hostname()}

" Set GUI options
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Input\ Mono\ Narrow\ Regular\ Semi-Condensed\ 11
    set lines=60 columns=100
  elseif has("gui_macvim")
    set guifont=InputMonoNarrow\ Thin:h14
    set lines=60 columns=100
  else
    set guifont=Input\ Mono\ Narrow:h11
  endif
endif
" set lines=60 columns=100
set guioptions-=m              " Menu bar
set guioptions-=T              " Tool bar

" Insert two empty lines and enter insert mode if opened from MUTT
" autocmd BufRead mutt* execute 'normal gg/\n\n\n^M2j'

" Commands for the external app `boxes`
if executable('boxes')
  vmap <Leader>mb !boxes -d c-cmt<CR>
  nmap <Leader>mb !!boxes -d c-cmt<CR>
  vmap <Leader>xb !boxes -d c-cmt -r<CR>
  nmap <Leader>xb !!boxes -d c-cmt -r<CR>

  autocmd BufEnter * nmap <Leader>mb !!boxes -d pound-cmt<CR>
  autocmd BufEnter * vmap <Leader>mb !boxes -d pound-cmt<CR>
  autocmd BufEnter * nmap <Leader>xb !!boxes -d pound-cmt -r<CR>
  autocmd BufEnter * vmap <Leader>xb !boxes -d pound-cmt -r<CR>
  autocmd BufEnter *.html nmap <Leader>mb !!boxes -d html-cmt<CR>
  autocmd BufEnter *.html vmap <Leader>mb !boxes -d html-cmt<CR>
  autocmd BufEnter *.html nmap <Leader>xb !!boxes -d html-cmt -r<CR>
  autocmd BufEnter *.html vmap <Leader>xb !boxes -d html-cmt -r<CR>
  autocmd BufEnter *.[chly],*.[pc]c nmap <Leader>mb !!boxes -d c-cmt<CR>
  autocmd BufEnter *.[chly],*.[pc]c vmap <Leader>mb !boxes -d c-cmt<CR>
  autocmd BufEnter *.[chly],*.[pc]c nmap <Leader>xb !!boxes -d c-cmt -r<CR>
  autocmd BufEnter *.[chly],*.[pc]c vmap <Leader>xb !boxes -d c-cmt -r<CR>
  autocmd BufEnter *.C,*.cpp,*.java nmap <Leader>mb !!boxes -d java-cmt<CR>
  autocmd BufEnter *.C,*.cpp,*.java vmap <Leader>mb !boxes -d java-cmt<CR>
  autocmd BufEnter *.C,*.cpp,*.java nmap <Leader>xb !!boxes -d java-cmt -r<CR>
  autocmd BufEnter *.C,*.cpp,*.java vmap <Leader>xb !boxes -d java-cmt -r<CR>
  autocmd BufEnter .vimrc*,.exrc nmap <Leader>mb !!boxes -d vim-cmt<CR>
  autocmd BufEnter .vimrc*,.exrc vmap <Leader>mb !boxes -d vim-cmt<CR>
  autocmd BufEnter .vimrc*,.exrc nmap <Leader>xb !!boxes -d vim-cmt -r<CR>
  autocmd BufEnter .vimrc*,.exrc vmap <Leader>xb !boxes -d vim-cmt -r<CR>
endif

" Show as much as possible of a wrapped last line, not just "@".
set display=lastline

" Delete trailing spaces on save
autocmd FileType c,cpp,java,css,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set PEP8 settings for Python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    " \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ set encoding=utf-8

" Flagging unnecessary whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set custom header for `Startify`
let g:startify_custom_header = [
\'    _    ___              ____   ___',
\'   | |  / (_)___ ___     ( __ ) <  /',
\'   | | / / / __ `__ \   / __  | / / ',
\'   | |/ / / / / / / /  / /_/ / / /  ',
\'   |___/_/_/ /_/ /_/   \____(_)_/   ',
\ ]
