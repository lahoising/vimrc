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

call plug#begin("~/.vim/plugged")
    Plug 'ayu-theme/ayu-vim'		" ayu theme
	Plug 'preservim/nerdtree'		" file tree
	Plug 'puremourning/vimspector', { 
		'do': 'python3 install_gadget.py --enable-c --enable-cpp --force-enable-csharp --enable-python'
	}  " debugging

	" if we are using neovim with version >= 0.5
	if has('nvim') && v:version >= 800
		Plug 'neovim/nvim-lspconfig'	" lsp
		Plug 'hrsh7th/nvim-compe'		" autocompletion
	else
		Plug 'ycm-core/YouCompleteMe'   " autocompletion
		Plug 'sheerun/vim-polyglot'     " syntax highlighting
	endif

call plug#end()

runtime include/colors.vim
runtime include/filetree.vim
runtime include/lsp.vim
