set relativenumber
set nu
set nowrap
set tabstop=4 softtabstop=4
set ignorecase
set incsearch
set scrolloff=8
set signcolumn=yes
set shiftwidth=4

call plug#begin("~/.vim/plugged")
	Plug 'ycm-core/YouCompleteMe'
    Plug 'ayu-theme/ayu-vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'puremourning/vimspector'
call plug#end()

syntax on
hi Normal guibg=NONE ctermbg=NONE

set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

nnoremap <C-]> :YcmCompleter GoTo<CR>
