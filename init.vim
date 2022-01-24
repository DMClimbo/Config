"============  plugin begin =============
call plug#begin()								

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'                               
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine' 
Plug 'puremourning/vimspector'
Plug 'tpope/vim-fugitive'

call plug#end() 
"============  plugin end ================


"============= general setting begin ==========
syntax on
set number
set showmatch
set relativenumber
let mapleader = "\<space>"
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
colorscheme gruvbox
set showcmd
set t_Co=256
set cursorline
set ignorecase
"============ general seting end  ========


"======== key mapping begin  =========
imap jk <esc>
imap <c-s> <esc>:w<cr>
nnoremap <leader>n :NERDTree<cr>
nnoremap <leader>q :q<cr>
nnoremap <c-s> :w<cr>
nnoremap <leader>z za
nnoremap <leader>e :e 
nnoremap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>vs :source ~/.config/nvim/init.vim<cr>

nnoremap <leader>ga :Git add .<cr>
nnoremap <leader>gc :Git commit -m 
nnoremap <leader>gp :Git push<cr>

"======== key ma ping end    ===========
