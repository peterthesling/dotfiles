"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Configuration "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
set bg=dark
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
"Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
  if has("gui_running")
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'powerlineish'
  endif
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_enable_branch     = 1
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
"Bundle 'ervandew/supertab'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
  " make YCM compatible with UltiSnips (using supertab)
  "let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  "let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  "let g:SuperTabDefaultCompletionType = '<C-n>'

  "" better key bindings for UltiSnipsExpandTrigger
  "let g:UltiSnipsExpandTrigger = "<tab>"
  "let g:UltiSnipsJumpForwardTrigger = "<tab>"
  "let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
  let delimitMate_expand_cr = 1
  let delimitMate_expand_space = 1

Plugin 'vim-ruby/vim-ruby'
  let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": [] }
  let g:syntastic_ruby_checkers = ['rubylint']
  let g:syntastic_ruby_rubocop_args = "-l --only"
  set shell=bash " fish uses non-standard redirection syntax, so we're fucked.
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
au FileType mail setlocal textwidth=80 formatoptions=twacq spell nolist bg=light
au FileType mail colorscheme solarized
Plugin 'jnwhiteh/vim-golang'
" LaTeX
  let g:syntastic_latex_chktex_args = "-l ~/.chktexrc"
  nnoremap <leader>ll :!xelatex %<cr>
  nnoremap <leader>lb :!xelatex %:r; bibtex %:r; xelatex %:r; xelatex %:r<cr>

call vundle#end()
filetype plugin indent on
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM User Interface "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
set nu

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set tm=500

" Long memory
set history=700

" Always show statusline
set laststatus=2

" Hidden characters!
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
colorscheme jellybeans
if has("gui_running")
  colorscheme tomorrow
  let g:airline_theme = 'tomorrow'
endif

set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" Set Japanese-style hard-wrap
" :set fp=fold\ -w80<CR>

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Toggle spell check
nnoremap <silent> <leader>s :set spell!<CR>
set spelllang=en_gb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
let mapleader = ","
let g:mapleader = ","

" Fast save
nmap <leader>w :w!<cr>

" Mouses are useful
set mouse=a

" Smashing escape mapping
inoremap jk <Esc>
inoremap kj <Esc>

" Indenting that keeps visuals selected
vnoremap < <gv
vnoremap > >gv

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Kwbd<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
    set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You
    " want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"Remember info about open buffers on close
set viminfo^=%

" Easily edit .vimrc
nmap <leader>v :split $MYVIMRC<CR>

" GUI Options
if has("gui_running")
  set guioptions-=L
  set guioptions-=r
  set showtabline=0
  let g:solarized_menu=0

  set guifont=Source\ Code\ Pro\ for\ Powerline 11
endif

