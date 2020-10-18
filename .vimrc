if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim-plugins')
Plug 'rafi/awesome-vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'chrisbra/csv.vim'
Plug 'sgur/vim-editorconfig'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jamessan/vim-gnupg'
Plug 'rhysd/vim-crystal'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'jlanzarotta/bufexplorer'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-syntastic/syntastic'
Plug 'zxqfl/tabnine-vim'
Plug 'posva/vim-vue'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

" no startup message
set shortmess+=I

" filetype specific plugins & indent
filetype plugin indent on

" syntax highlighting & line numbers
syntax on
set number

" color scheme
set background=dark
color gruvbox

" don't color line numbers differently from the background
hi LineNr ctermbg=bg guibg=bg

" make SpecialKey look less special
hi clear SpecialKey
hi link SpecialKey Comment

" visible whitespace
set list listchars=tab:→\ ,trail:·,nbsp:⎵

" no need to draw borders with characters, they are already colored
set fillchars=vert:\

" split from left to right and top to bottom
set splitbelow
set splitright

" don't wrap long lines
set nowrap

" don't wrap in the middle of words
set linebreak

" ctrl - hjkl to switch panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" persistent undo with the undo files in a separate dir
set undofile undodir=~/.vim/undodir

" rainbow parens
let g:rainbow_active = 1

" don't light up my cursor on parens
let loaded_matchparen = 0

" don't show --INSERT-- etc on the last line
set noshowmode

" lightline
set laststatus=2 ttimeoutlen=30
let g:lightline = {
\	"colorscheme": "wombat",
\	"subseparator": {"left": "","right": ""},
\	"active": {
\		"left": [["mode"], ["filename", "modified"]],
\		"right": [["percent"], ["gitbranch"], ["syntastic"]]
\	},
\	"inactive": {
\		"left": [["filename", "modified"]],
\		"right": []
\	},
\	"component_function": {
\		"gitbranch": "fugitive#head"
\	},
\	"component_expand": {
\		"syntastic": "SyntasticStatuslineFlag",
\	},
\	"component_type": {
\		"syntastic": "error",
\	}
\}

" update lightline on syntastic notice
function! SyntasticCheckHook(errors)
	call lightline#update()
endfunction

" fuzzy file search
nnoremap <c-p> :FZF<cr>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" buffer menu
nnoremap <c-b> :BufExplorer<cr>

" autocompletion settings
set completeopt=menuone,preview
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" disable gitgutter on startup
let g:gitgutter_enabled = 0

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType javascript let b:syntastic_javascript_jscs_args =
    \ get(g:, 'syntastic_javascript_eslint_args', '') .
    \ FindConfig('-c', '.eslintrc', expand('<afile>:p:h', 1))

"
set nofixeol

" use ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'
