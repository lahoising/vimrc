call plug#begin('~/.config/nvim/plugged')
	Plug 'preservim/nerdtree'

	Plug 'xiyaowong/nvim-transparent'
	Plug 'ayu-theme/ayu-vim'

	# Plug 'williamboman/nvim-lsp-installer'
	Plug 'neovim/nvim-lspconfig'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --force-enable-java'}
call plug#end()
