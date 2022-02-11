let g:VIM:HOME = expand('~/.config/nvim')
let g:VIM_HOME = expand('~/.config/nvim')
"-----------------------------------------------
                Plug Setting 
"-----------------------------------------------
let s:vim_plug_path = g:VIM_HOME.'/autoload/plug.vim'
if !filereadable(s:vim_plug_path)
	echo "Installing Vim-plug ..."
	echo ""
	let s:vim_plug_git = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	execute "!curl -fLo ".s:vim_plug_path." --create-dirs ".s:vim_plug_git
endif
let s:vim_plugged_path = g:VIM_HOME.'/plugged'


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


function! s:is_need_install()
	for l:plug_name in g:plugs_order
		let l:plug_path = s:vim_plugged_path.'/'.l:plug_name
		if !isdirectory(l:plug_path)
			return 1
		endif
    endfor
endfunction

if s:is_need_install()
	echom "Found new plugin(s) need to install."
	:PlugInstall
endif


"-----------------------------------------------
"               General Setting 
"-----------------------------------------------

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


"-----------------------------------------------
"                Key Mapping
"-----------------------------------------------
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

