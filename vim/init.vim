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
	Plug 'ycm-core/YouCompleteMe', {'do': './install.py --clangd-completer' }
call plug#end()

set termguicolors
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme ayu

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <space>gd :YcmCompleter GoTo<CR>
nnoremap <space>gr :YcmCompleter GoToReferences<CR>
nnoremap <space>r :YcmCompleter RefactorRename 
