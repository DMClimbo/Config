"general setting
syntax on
set number
set showmatch
set relativenumber
let mapleader = "\<space>"

"Plugin
call plug#begin()								

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'                               
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

call plug#end() 


colorscheme gruvbox

"key mapping
imap jk <Esc>
imap <C-s> <ESC>:w<cr>
map <F2> :NERDTree<cr>
n
