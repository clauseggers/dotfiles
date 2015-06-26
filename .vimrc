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
Plugin 'vim-scripts/ZoomWin'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'airblade/vim-rooter'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'nathanaelkane/vim-indent-guides'

" Documentation look-up
if has('mac')
	Plugin 'rizzatti/dash.vim'
elseif has('unix')
	Plugin 'KabbAmine/zeavim.vim'
endif

" Vim frontend for the Perl module `Ack`. Replacement for `grep`. 
if executable('ag')
	Plugin 'epmatsw/ag.vim.git'
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
Plugin 'bling/vim-airline'

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

" Options for Vim
set wrap
set noswapfile
set wildmode=list:longest,full
set wildmenu
set hlsearch
set incsearch			" show search matches as you type
set number
set mouse=a
set cursorline			" hilight cursor line
set more						" ---more--- like less
set number          " line numbers
set scrolloff=3     " lines above/below cursor
set showcmd         " show cmds being typed
set title						" window title
set history=1000		" default 20
set iskeyword+=_,$,@,%,#			" not word dividers
set laststatus=2		" always show statusline
set linebreak
set shiftwidth=2
set tabstop=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
syntax enable
set background=dark
colorscheme solarized
highlight Comment cterm=italic

" Mapleader mappings
let mapleader = ","
" Buffer wipe
map <Leader>w :bw<CR>
" Tcomment toggle
map <Leader>c :TComment<CR>

" Docmentation look-up
if has('mac')
	nmap <silent> <leader>d <Plug>DashSearch
elseif has('unix')
	let g:zv_disable_mapping = 1
	nmap <leader>d <Plug>Zeavim          					" <leader>d (NORMAL mode)
	vmap <leader>d <Plug>ZVVisSelection  					" <leader>d (VISUAL mode)
	nmap <leader>D <Plug>ZVKeyword       					" <leader>D
	nmap <leader><leader>d <Plug>ZVKeyDocset      " <leader><leader>d 
endif

" KEYMAPPINGS
" Enable Alt+[key] as the Meta-key for 7-bit mode terminal emulators, eg. Gnome
" Terminal. This allow you to enter character with diacritics using the
" Alt-key. See also the use of `/etc/inputrc` and `~/.inputrc` for BASH, and
" ZLE for ZSH, as these are possibly better places to place such things.
" let c='a'
" while c <= 'z'
" 	exec "set <A-".c.">=\e".c
" 	exec "imap \e".c." <A-".c.">"
" 	let c = nr2char(1+char2nr(c))
" endw

" Set option to make `Twonk/autoclose` work with arrow-up.
if !has("gui_running")
	let g:AutoClosePreservDotReg = 0
endif

" Add <angular brackets> to `Twonk/autoclose`.
let g:AutoClosePairs_add = "<>"

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
map <left> :bprevious<CR>
map <right> :bnext<CR>
" Show the YankCring buffer
nnoremap <silent> <F6> :YRShow<CR>

" Map <kj> to enter normal mode.
imap kj <Esc>

" M compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" New tab
map <C-t> <esc>:tabnew<CR>
" Close tab
map <C-x> <C-w>c

" Render terminal window title-string
" set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}\ hostname()
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:p:h\")})%)%(\ %a%)\ %{$USER}@%{hostname()}

" Set GUI options
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Input\ Mono\ Narrow\ Semi-Light\ Semi-Condensed\ 12
	elseif has("gui_mac")
		set guifont=InputMonoNarrow\ Thin:h16
	else 
		set guifont=Input\ Mono\ Narrow:h12
	endif
endif
set lines=60 columns=100

" Insert two empty lines and enter insert mode if opened from MUTT
" autocmd BufRead mutt* execute 'normal gg/\n\n\n^M2j'

