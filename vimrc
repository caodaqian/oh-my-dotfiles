set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
call vundle#end()       " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" scrooloose/nerdtree setting
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

"" YouCompleteMe setting
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_invoke_completion='<C-a>'
set completeopt-=preview
"nnoremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" altercation/vim-colors-solarized setting
syntax enable
set background=dark
if has('gui_running')
	"set background=light
	colorscheme solarized
else
	colorscheme koehler
endif

" SimplyFold setting
let g:SimpylFold_docstring_preview=1

" airline setting
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='kalisi'
"let python_highlight_all=1

" mark badwhitespace with red
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding with the spacebar
nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" basic setting
syntax on
set backspace=indent,eol,start
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set cindent
set showcmd
set t_Co=256
set wrap
set linebreak
set showmatch
set hlsearch
set history=188
set scrolloff=5
set encoding=utf-8
set clipboard=unnamed
set foldmethod=indent
set foldlevel=99
set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=green guibg=NONE guifg=NONE
