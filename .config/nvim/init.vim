set nocompatible              " be iMproved, required
filetype plugin indent on
syntax on
" set encoding=utf-8            " The encoding displayed.
" set fileencoding=utf-8        " The encoding written to file.

" Path to the Homebrew python
" let g:python3_host_prog = '/opt/homebrew/bin/python3'

" **************************
" Plugins
" **************************

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

" Unicode matters (See also under LaTeX plugins)
Plug 'chrisbra/unicode.vim'

" Color schemes
Plug 'lifepillar/vim-solarized8'

" Files
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Utility
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
" Plug 'vim-scripts/ZoomWin'
Plug 'troydm/zoomwintab.vim'

" Plug `registers`
Plug 'tversteeg/registers.nvim'

" Completion
" NOTE: `ncm2` options below
" Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
" Plug 'ncm2/ncm2'
" NOTE: Completion sources needed.
" Check the wiki for sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Spelling is now a built-in function.
" Plug 'fgrsnau/ncm2-aspell'
" Plug 'ncm2/ncm2-cssomni'
" Plug 'ncm2/ncm2-tern'
" Plug 'ncm2/ncm2-jedi'
" NOTE: `ncm2-phpactor` requires Composer, `phpactor`, `ncm2`, and `nvim-yarp`.
" Plug 'phpactor/ncm2-phpactor'
" NOTE: Include `phpactor`, and install it as a plugin (requires Composer).
" Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

" LaTeX
Plug 'lervag/vimtex'
" NOTE: `ncm2-biblatex` requires `bibparse`, install with `pip3 install bibparse`
" Plug 'oncomouse/ncm2-biblatex'
" Type in LaTeX, output Unicode.
" Unicoder is using the <c-l> keyboard shortcut,
" which collides with my buffer cycling shortcut.
" Plug 'joom/latex-unicoder.vim'

" Plug 'airblade/vim-rooter'
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
if executable('rg')
  Plug 'mileszs/ack.vim'
endif

Plug 'kshenoy/vim-signature'

" Web development
Plug 'othree/html5.vim'
Plug 'gorodinskiy/vim-coloresque'
" Plug 'hail2u/vim-css3-syntax'
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
" Plug 'ervandew/supertab'

" Fuzzy finder (files, mru, etc)
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'wincent/command-t'

" A pretty statusline, bufferline integration
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NOTE: Autoclose tags like <(," &c.
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

" Strip spaces at end of lines.
Plug 'axelf4/vim-strip-trailing-whitespace'

" Vim-devicons uses Nerd-patched fonts.
" NOTE: Load as last plugin.
Plug 'ryanoasis/vim-devicons'

" End of Plug section
call plug#end()




" **************************
" Neovim options
" **************************

" Options for Vim
set wrap
set noswapfile
set wildmode=list:longest,full
set wildmenu
set hlsearch
set incsearch                  " show search matches as you type
set mouse=a
" Scroll behaviour is needed for Gnome
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
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
autocmd BufNewFile,BufReadPost *.fea set filetype=fea

" Remapping Ctrl+j and Ctrl+k to half-page up and down
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" Set instant time-out for Esc-key (Meta).
" `timeoutlen` is used for mapping delays,
" and `ttimeoutlen` is used for key code delays.
set timeoutlen=600 ttimeoutlen=0

" Remap colon to semi-colon
nnoremap ; :

" Mapleader mappings
let mapleader = ","

" Map <kj> to enter normal mode.
imap kj <Esc>

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

" Buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Cycle open buffers
set hidden
noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>

" Cycle open tabs
" NOTE: Meta-key has to be defines in the terminal emulator used.
" Eg. iTerm > Preferences > Profiles > Keys Set to `Esc+`
map <M-h> gt
map <M-l> gT

" Highlight the yanks (Neovim built-in)
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END

" Registers 2.0 plugin Lua config
lua << EOF
local registers = require("registers")
registers.setup({
  show_empty = false,
  symbols = {
    space = "·"
  },
  window = {
    border = "shadow"
  }
})
EOF

" Show the yank registers
" imap <leader>r :Registers<CR>
map <leader>r :Registers<CR>

" Show as much as possible of a wrapped last line, not just "@".
set display=lastline

" Delete trailing spaces on save
autocmd FileType c,cpp,java,css,php,bib autocmd BufWritePre <buffer> :%s/\s\+$//e

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

" Close without saving using QQ
map <S-Q><S-Q> :q!<CR>

" Save as sudo using `:W`
" command W w !sudo tee % > /dev/null

" Render terminal window title-string
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:p:h\")})%)%(\ %a%)\ %{$USER}@%{hostname()}
" Clear TTY after exiting Vim
" au VimLeave * :!clear

" Enable built-in spelling
set spelllang=en_gb,da_dk

" Toggle spelling with F10
nnoremap <silent> <F10> :set spell!<cr>
inoremap <silent> <F10> <C-O>:set spell!<cr>
" [s: go to previous spell error
" ]s: go to next spell error
" zg to add the word to your spell list
" z= to choose from a list of suggestions

" Re-format indentation for the whole buffer
map <F7> mzgg=G`z

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




" **************************
" Plugin options
" **************************

" Options for `UltiSnipsExpandTrigger`
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Options for `ZoomWinTab`
map <Bslash> :ZoomWinTabToggle<CR>

" Options for `airline`
" Set font option for airline
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Options for CtrlP to show dotfiles
" `show_hidden` does not apply when a `user_command` has been set.
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Folders and files CtrlP shall ignore
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.cache\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
" If it is installed, use RipGrep as the binary.
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --hidden --ignore-case --files --color=never --glob ""'
  " Disabling caching is sometimes the better option.
  let g:ctrlp_use_caching = 0
endif

" Options for`NerdTree`
nnoremap <leader>f :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

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
let g:syntastic_python_python_exec = 'python3'
" Hide/show the Syntastic buffer
nnoremap <expr> <f13> len(filter(range(1, winnr('$')), 'getbufvar(winbufnr(v:val), "&buftype") == "quickfix"')) ? ":\<c-u>lclose\<cr>" : ":\<c-u>SyntasticCheck\<cr>"

" Auto-complete options
" Enable NCM2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" Suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you do't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
      \ 'name' : 'css',
      \ 'priority': 9,
      \ 'subscope_enable': 1,
      \ 'scope': ['css','scss'],
      \ 'mark': 'css',
      \ 'word_pattern': '[\w\-]+',
      \ 'complete_pattern': ':\s*',
      \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
      \ })
au User Ncm2Plugin call ncm2#register_source({
      \ 'name' : 'vimtex',
      \ 'priority': 1,
      \ 'subscope_enable': 1,
      \ 'complete_length': 1,
      \ 'scope': ['tex'],
      \ 'mark': 'tex',
      \ 'word_pattern': '\w+',
      \ 'complete_pattern': g:vimtex#re#ncm,
      \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
      \ })
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

" Options for `vim-ident-guide`
nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

" Options for `Tabular`
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

" Set option to make `twonk/autoclose` work with arrow-up.
if !has("gui_running")
  let g:AutoClosePreservDotReg = 0
endif

" Add <angular brackets> to `twonk/autoclose`.
let g:AutoClosePairs_add = "<>"

" Use `rg` instead of `grep` and instead of `ack` in the `ack.vim` plugin.
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Set path to Startify file
set viminfo='100,n$HOME/.config/nvim/.viminfo

" Keyboard short-cut for Startify
map <F14> :Startify<CR>

" Set custom header for `Startify`
let g:startify_custom_header = [
\ '     _   __         _    ___         ',
\ '    / | / /__  ____| |  / (_)___ ___ ',
\ '   /  |/ / _ \/ __ \ | / / / __ `__ \',
\ '  / /|  /  __/ /_/ / |/ / / / / / / /',
\ ' /_/ |_/\___/\____/|___/_/_/ /_/ /_/ ',
\ ]




" **************************
" External app options
" **************************

" Insert two empty lines and enter insert mode if opened from `NeoMutt`
autocmd BufRead neomutt* execute 'normal gg/\n\n\n^M2j'

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

