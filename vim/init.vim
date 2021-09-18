set relativenumber
set nu
set nowrap
set tabstop=4 softtabstop=4
set ignorecase
set incsearch
set scrolloff=8
set signcolumn=yes
set shiftwidth=4
set noswapfile
set nobackup

call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'ayu-theme/ayu-vim'
call plug#end()

set termguicolors
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

nnoremap <C-E> :NERDTreeToggle<CR>
nnoremap <C-F> :NERDTreeFind<CR>
