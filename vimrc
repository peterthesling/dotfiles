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
" Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
let g:airline_symbols = {}
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#branch#enabled= 1
  let g:airline_left_sep = '»'
  let g:airline_right_sep = '«'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
" Bundle 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
  let g:ycm_confirm_extra_conf = 0
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
  " make YCM compatible with UltiSnips (using supertab)
  " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  " let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  " let g:SuperTabDefaultCompletionType = '<C-n>'
  " let g:UltiSnipsExpandTrigger = "<tab>"
  " let g:UltiSnipsJumpForwardTrigger = "<tab>"
  " let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
  let delimitMate_expand_cr = 1
  let delimitMate_expand_space = 1
Plugin 'tommcdo/vim-lion'

Plugin 'vim-ruby/vim-ruby'
  let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [],  "passive_filetypes": ["tex"] }
  let g:syntastic_ruby_checkers = ['rubylint']
  let g:syntastic_ruby_rubocop_args = "-l --only"
  set shell=bash " fish uses non-standard redirection syntax, so we're fucked.
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
au FileType mail setlocal textwidth=80 formatoptions=twacq spell nolist bg=light
Plugin 'jnwhiteh/vim-golang'
" LaTeX
  let g:syntastic_latex_chktex_args = "-l ~/.chktexrc"
  au FileType tex nnoremap <leader>ll :!lualatex %<cr>
  au FileType tex nnoremap <leader>lb :!lualatex %:r; biber %:r; lualatex %:r;<cr>
  au FileType tex nnoremap <leader>lv :!open %:r.pdf<cr>
" C++
  "let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
  "let g:syntastic_cpp_compiler_options = "-std=c++11 -pedantic -Wall -Werror -Wextra"
  "let g:syntastic_cpp_cpplint_args = "--verbose=0"


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
set t_Co=256
colo jellybeans
if has("gui_running")
  set bg=light
  colo solarized
endif

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

set lbr
set tw=80

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

  set guifont=Source\ Code\ Pro\ for\ Powerline
endif

set encoding=utf8
if has("gui_running")
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'solarized'
endif

nnoremap <silent><leader>lcd :cd %:p:h<cr>
