call plug#begin()
	Plug 'preservim/nerdtree'

	Plug 'xiyaowong/nvim-transparent'
	Plug 'ayu-theme/ayu-vim'

	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'rafamadriz/friendly-snippets'

	Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --force-enable-java'}

	Plug 'lahoising/nvim_utils_plug'
call plug#end()
