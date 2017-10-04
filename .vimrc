" URL: http://vim.wikia.com/wiki/Example_vimrc
"Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
"Description: A minimal, but feature rich, example .vimrc. If you are a
"             newbie, basing your first .vimrc on this file is a good
" 	      choice.
"             If you're a more advanced user, building your own .vimrc
"     	      based
"             on this file is still a good idea.



" Frontmatter ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"Set 'nocompatible' to ward off unexpected things that your distro might
"have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" General Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set number                      " line numbering
set showcmd                     " incomplete cmds displayed at bottom
set showmode                    " active mode displayed at bottom
set ignorecase                  " use case insensitive search, except when using capital letters
set smartcase                   " except when using capital letters
set history=300                 " num lines of :cmdline history to retain
set gcr=a:blinkon0              " no cursor blink
set visualbell                  " no beep
set autoread                    " reload file on external changes
set backspace=indent,eol,start  " backspace on in insert mode
syntax on                       " colorized syntax highlighting

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
"""let mapleader=","

" ============== PATHOGEN ===============
" Enables easy plugin installations. 
" Note, set near the top of .vimrc 
   
execute pathogen#infect()

" ================= Color ==================

" Solarized Scheme
syntax enable
set background=dark
let g:solarized_visibility="low"
colorscheme solarized

"Toggle backgnd function
call togglebg#map("<F5>")


" Environment ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set encoding=utf-8              " unicode encoding by default
set title                       " show title in terminal
set clipboard+=unnamed          " unnamed buffer set to gui register * so that dd == "*dd

"Highlight searches (use <C-L> to temporarily turn off highlighting; see
"the mapping of <C-L> below)
set hlsearch

"Stop certain movements from always going to the first character of a line.
"While this behaviour deviates from that of Vi, it does what most users
"coming from other editors would expect.
set nostartofline
"
"Display the cursor position on the last line of the screen or in the
"status
"line of a window
set ruler

"Always display the status line, even if only one window is displayed
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

"Instead of failing a command because of unsaved changes, raise a
"dialogue asking if you wish to save changed files.
set confirm

"Enable use of the mouse for all modes
set mouse=a

"Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

"Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

"Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>

" This is totally awesome - remap jj to escape in insert mode.  You'll never
" type jj anyway, so it's great!
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" ============ Persisitent Undo ===============

" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
   silent !mkdir ~/.vim/backups > /dev/null 2>&1
   set undodir=~/.vim/backups
   set undofile
endif

"Store backups in folder
set backupdir=~/.vim/backups


" ============= Indentation options ===============

"When opening a new line and no filetype-specific indenting is enabled,
"keep
"the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent


"Spaces are better than a tab character
set smarttab
set expandtab

"Indentation settings for using 2 spaces instead of tabs.
"Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set tabstop=4

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
"set list listchars=tab:>>

set nowrap      "Don't wrap lines
set linebreak   "Wrap lines at convenient points

" ============== Folds =================

set foldmethod=indent     "fold based on indent
set foldnestmax=3         "deepest fold is 3 levels
set nofoldenable          "dont fold by default

" ============== Auto-Completion ===============

set wildmode=list:longest,full
set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" =============== Scrolling ==============

set scrolloff=8       "start scrolling when 8 lines away from margins
set sidescrolloff=15
set sidescroll=1 

" =============== Mappings ===============

"Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
"which is the default
map Y y$

"Map <C-L> (redraw screen) to also turn off search highlighting until the
"next search
nnoremap <C-L> :nohl<CR><C-L>


" Edit vimrc \ev
nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>

nmap <C-Tab> :tabnext<CR>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" ================= FUNCTIONS ======================

"{{{ MISC

" Octave syntax
augroup filetypedetect
au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Shortcuts +++++++++++++++++++++++++++++++++++++++++++++++++++++++

ab #b /*************************************************************
ab #e *************************************************************/

