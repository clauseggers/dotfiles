set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

" Files
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Utility
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
" Plugin 'vim-scripts/ZoomWin'
Plugin 'troydm/zoomwintab.vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'airblade/vim-rooter'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'godlygeek/tabular'
Plugin 'mrtazz/simplenote.vim'

" Documentation look-up
if has('mac')
  Plugin 'rizzatti/dash.vim'
elseif has('unix')
  Plugin 'KabbAmine/zeavim.vim'
endif

" Vim frontend for the Perl module `Ack`. Replacement for `grep`.
if executable('ag')
  Plugin 'epmatsw/ag.vim'
elseif executable('ack')
  Plugin 'mileszs/ack.vim'
endif

Plugin 'kshenoy/vim-signature'

" Web development
Plugin 'othree/html5.vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
" HAML, SASS, and SCSS
Plugin 'tpope/vim-haml'

" Rails
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-haml'
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'tpope/vim-cucumber'

" Ruby
" if exists("$rvm_path")
"  Plugin 'tpope/vim-rvm'
" end
" Plugin 'tpope/vim-endwise'
" Plugin 'kana/vim-textobj-user'
" Plugin 'nelstrom/vim-textobj-rubyblock'
" Plugin 'lucapette/vim-ruby-doc'

" Markdown
Plugin 'tpope/vim-markdown'

" Edit files using sudo/su
Plugin 'chrisbra/SudoEdit.vim'

" <Tab> everything!
Plugin 'ervandew/supertab'

" Fuzzy finder (files, mru, etc)
Plugin 'kien/ctrlp.vim'
" Plugin 'wincent/command-t'

" A pretty statusline, bufferline integration
" Plugin 'itchyny/lightline.vim'
" Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Autoclose (, " etc
" Regrettably vim-autoclose collides with the keyboard <Up> used with YCM,
" but that can be fixed with the `AutoClosePreservDotReg` setting below.
Plugin 'Townk/vim-autoclose'

" Snippets like textmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
" Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'

" A fancy start screen, shows MRU etc.
Plugin 'mhinz/vim-startify'

" Awesome syntax checker.
" REQUIREMENTS: See :h syntastic-intro
Plugin 'scrooloose/syntastic'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter.git'

" Tmux
" Plugin 'benmills/vimux'
" Plugin 'jgdavey/vim-turbux'

" Swift programming language syntax high-lighting and indentation
Plugin 'keith/swift.vim'

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
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_checkers = ['php', 'phpcs']
" Disable all style messages
let g:syntastic_quiet_messages = { "type": "style" }
" To configure the `python` checker to use Python3 rather than Python2 enable:
" let g:syntastic_python_python_exec = '/usr/bin/python3'

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
set cursorline                 " hilight cursor line
set more                       " ---more--- like less
set number                     " line numbers
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
" set list listchars=tab:→·,trail:·,eol:¶
set list listchars=tab:→·,trail:·
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Solarized and terminfo preferences
syntax enable
set background=dark
let g:solarized_visibility = "normal"
" let g:solarized_termtrans=1
colorscheme solarized
highlight Comment cterm=italic

" Store `.viminfo` files in `.vim` folder
set viminfo+=n~/.vim/.viminfo

" Relative line-numbers in normal mode
" set relativenumber
set number
" au FocusLost * :set number
" au FocusGained * :set relativenumber
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Mapleader mappings
let mapleader = ","

" Buffer wipe
map <Leader>w :bw<CR>

" Hide the current search highlights
map <Leader>s :noh<CR>

" Tcomment toggle
map <Leader>c :TComment<CR>

" Function to toggle absolute and relative line-numbers
let g:NumberToggleTrigger = "<Leader>n"

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

" Keymapping for `ag` aka. `The Silver Searcher`
if executable('ag')
  let g:ag_prg = "ag --column"

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " `ag` is too slow for `CtrlP`

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
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

" NerdTree
nnoremap <F5> :buffers<CR>:buffer<Space>

" Re-format indentation for the whole buffer
map <F7> mzgg=G`z

" Buffer cycling
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

" M compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

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

" Show as much as possible of a wrapped last line, not just "@".
set display=lastline

" Delete trailing spaces on save
autocmd FileType c,cpp,java,css,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Set custom header for `Startify`
let g:startify_custom_header = [
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            \ '                                                        ',
            \ ]

