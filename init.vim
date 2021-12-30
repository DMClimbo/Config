"general setting
syntax on
colorscheme gruvbox
set number
set showmatch

call plug#begin()								

Plug 'itchyny/lightline.vim'                                  
Plug 'preservim/nerdtree'                                   
Plug 'artanikin/vim-synthwave84'                    
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

call plug#end()


"key mapping
imap jk <Esc>
imap <C-s> <ESC>:w<cr>
map <F2> :NERDTree<cr>
map <space> :
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j

