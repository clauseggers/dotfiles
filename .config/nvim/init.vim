set nocompatible              " be iMproved, required
filetype off                  " required

" vim-plug plugin manager
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Load vim-plug
call plug#begin()

" Sensible defaults
Plug 'tpope/vim-sensible'

" Color schemes
Plug 'lifepillar/vim-solarized8'

" Files
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
" Plug 'vim-scripts/ZoomWin'
Plug 'troydm/zoomwintab.vim'

" Completion
" Plug 'Shugo/ddc.vim'
" Plug 'vim-denops/denops.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" NOTE: Completion sources needed.
" Check the wiki for sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'fgrsnau/ncm2-aspell'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-jedi'
Plug 'phpactor/ncm2-phpactor'
" Plug 'oncomouse/ncm2-biblatex'

" Plug 'airblade/vim-rooter'
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
elseif has('rg')
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

" Rails
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-haml'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'kchmck/vim-coffee-script'
" Plug 'tpope/vim-cucumber'

" Ruby
" if exists("$rvm_path")
"  Plug 'tpope/vim-rvm'
" end
" Plug 'tpope/vim-endwise'
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'lucapette/vim-ruby-doc'

" Markdown
Plug 'tpope/vim-markdown'

" Edit files using sudo/su
Plug 'chrisbra/SudoEdit.vim'

" <Tab> everything!
Plug 'ervandew/supertab'

" Fuzzy finder (files, mru, etc)
Plug 'kien/ctrlp.vim'
" Plug 'wincent/command-t'

" A pretty statusline, bufferline integration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autoclose (, " etc
" Regrettably vim-autoclose collides with the keyboard <Up> used with YCM,
" but that can be fixed with the `AutoClosePreservDotReg` setting below.
Plug 'Townk/vim-autoclose'

" Snippets like textmate
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'honza/vim-snippets'
" Plug 'garbas/vim-snipmate'
" Plug 'SirVer/ultisnips'

" A fancy start screen, shows MRU etc.
Plug 'mhinz/vim-startify'

" Awesome syntax checker.
" REQUIREMENTS: See :h syntastic-intro
Plug 'scrooloose/syntastic'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux
" Plug 'benmills/vimux'
" Plug 'jgdavey/vim-turbux'

" Swift programming language syntax high-lighting and indentation
Plug 'keith/swift.vim'

" End of Plug section
call plug#end()


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

" Options for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Enabled checkers
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_python_checkers = ['mypy']
let g:syntastic_sh_checkers = ['shellcheck', 'sh']
" Disable all style messages
let g:syntastic_quiet_messages = { "type": "style" }
" To configure the `python` checker to use Python3 rather than Python2 enable:
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" Enable NCM2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
" (Collides with Supertab)
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Python completion for NCM2 via the jedi library.
" g:ncm2_jedi#3

" Options for `simplenote`
source $HOME/.simplenotevimrc
let g:SimplenoteSortOrder = "pinned, modifydate"
let g:SimplenoteFiletype = "txt"
" let g:SimplenoteListHeight = 10
let g:SimplenoteSingleWindow = 1
map <F4> :SimplenoteList<CR>
nnoremap <Leader>nn :SimplenoteNew<CR>

" Options for `ZoomWinTab`
map <Bslash> :ZoomWinTabToggle<CR>

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
set termguicolors
syntax enable
set background=dark
autocmd vimenter * ++nested colorscheme solarized8
" let g:gitgutter_override_sign_column_highlight = 0
" Two commands below if there is problems with TMUX.
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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

" KEYMAPPINGS
" Enable Alt+[key] as the Meta-key for 7-bit mode terminal emulators, eg. Gnome
" Terminal. This allow you to enter character with diacritics using the
" Alt-key. See also the use of `/etc/inputrc` and `~/.inputrc` for BASH, and
" ZLE for ZSH, as these are possibly better places to place such things.
" let c='a'
" while c <= 'z'
"   exec "set <A-".c.">=\e".c
"   exec "imap \e".c." <A-".c.">"
"   let c = nr2char(1+char2nr(c))
" endw

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
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Re-format indentation for the whole buffer
map <F7> mzgg=G`z

" NerdTree
map <F8> :NERDTreeToggle<CR>

" Show open buffers
set hidden
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>

" Show the YankCring buffer
nnoremap <silent> <F6> :YRShow<CR>

" Yank the search pattern to the yankring with `y/`
nnoremap <silent> y/ :let @"=@/<CR>

" Yank the search pattern to the system clipboard with `y*`
" nnoremap <silent> y/ :let @*=@/<CR>

" Map <kj> to enter normal mode.
imap kj <Esc>

" Insert empty lines with ]<Space> and [<Space> without entering insert mode
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Save file with <C-s> shortcut
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" New tab
map <C-t> <esc>:tabnew<CR>
" Close tab
map <C-x> <C-w>c

" Close without saving using QQ
map <S-Q><S-Q> :q!<CR>

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
    set guifont=InputMonoNarrow\ Thin:h15
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

" Set path to Startify file
set viminfo='100,n$HOME/.config/nvim/.viminfo

" Set custom header for `Startify`
let g:startify_custom_header = [
\ '     _   __         _    ___         ',
\ '    / | / /__  ____| |  / (_)___ ___ ',
\ '   /  |/ / _ \/ __ \ | / / / __ `__ \',
\ '  / /|  /  __/ /_/ / |/ / / / / / / /',
\ ' /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
\ ]

