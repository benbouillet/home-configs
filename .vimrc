" All ideas taken from :  https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set nocompatible
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
" PEP 8 checking
Plugin 'nvie/vim-flake8'
" Color schemes: solarized for GUI mode, and Zenburn for terminal mode
" Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Proper file tree
Plugin 'scrooloose/nerdtree'
" Use of Tabs (unnecessary with buffers)
Plugin 'jistr/vim-nerdtree-tabs'
" Super search
Plugin 'kien/ctrlp.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
" Powerful status line
Plugin 'vim-airline/vim-airline'
" vim-airline themes
Plugin 'vim-airline/vim-airline-themes'
" simplyFold
Plugin 'tmhedberg/SimpylFold'
" Auto-completion
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <space> za

" Enable folding
set foldmethod=indent
set foldlevel=99

" Docstring for folded code enabled
let g:SimpylFold_docstring_preview=1

" adds the proper PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Enable folding with the spacebar
nnoremap <space> za

" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 Support
set encoding=utf-8

" YouCompleteMe The former line ensures that the autocomplete window goes away
" when you’re done with it, and the latter defines a shortcut for goto
" definition.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax highlighting
let python_highlight_all=1
syntax on

" Color settings
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Switching between dark & light mode (pressing F5)
call togglebg#map("<F5>")

" Hiding .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Insert lines number at the beginning of the line
set nu

" Access system clipboard
set clipboard=unnamed

" Navigation between buffers without having to write them
set hidden

" More natural splits
set splitbelow
set splitright

" vim-airline setup
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" vim-airline theme setup
let g:airline_theme='jellybeans'

" Highlight search patterns
:set hlsearch

" Recommended beginner settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" system clipboard enabled
:set clipboard=unnamedplus

" Highlighting character after #79
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter * match OverLength /\%79v.*/
augroup END
