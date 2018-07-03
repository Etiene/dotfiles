map <C-Up> :tabprevious<CR>
map <C-Down> :tabnext<CR>
" :hi Directory guifg=#eb7cad ctermfg=magenta
set mouse=a
set nocompatible              " be iMproved, required
filetype off                  " required
colorscheme gruvbox
set nobackup
set nowritebackup
set noswapfile
nnoremap <silent> k gk
nnoremap <silent> j gj
au FocusLost * :wa
set backspace=indent,eol,start
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/grep.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'avelino/vim-bootstrap-updater'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'roxma/nvim-yarp'
" Plugin 'vim-syntastic/syntastic'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-haml'
Plugin 'mattn/emmet-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'xolox/vim-misc'
Plugin 'davidhalter/jedi-vim'
Plugin 'raimon49/requirements.txt.vim', {'for': 'requirements'}
" " ruby
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-projectionist'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ecomba/vim-ruby-refactoring'

Plugin 'ctrlpvim/ctrlp.vim'


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
" see :h vundle for more details or wiki for FAQ
"

set background=dark
set tabstop=2 softtabstop=0 shiftwidth=0
autocmd Filetype lua setlocal ts=3 sw=3 sts=0 expandtab
set autoindent
set hlsearch modeline modelines=5
set scrolloff=7
set textwidth=80
set autochdir
syntax on
set ruler
set number

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_lua_luacheck_args = "--no-unused-args"

" nerdtree config
" let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeMouseMode=2
" autocmd vimenter * NERDTree
" autocmd vimenter * NERDTreeTabsOpen
let g:nerdtree_tabs_focus_on_files = 1
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdcommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" indendline
let g:indentLine_leadingSpaceEnabled = 1

" JS format on save, remove trailing whitespace for rest
function! PrettyFile()
  if &filetype=="javascript"
    if exists('g:loaded_Beautifier')
      call JsBeautify()
    endif
    if exists('g:loaded_ESLintFix')
      call ESLintFix()
		endif
	else
		 autocmd BufWritePre * :%s/\s\+$//e
  endif
endfunction

"pretty the file before saving.
autocmd BufWritePre * execute 'call PrettyFile()'


