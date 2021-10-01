local cmp = require'cmp'

cmp.setup({
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<TAB>'] = cmp.mapping.select_next_item(),
		['<s-TAB>'] = cmp.mapping.select_prev_item()
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' }
	}
})

local on_attach = function(client,bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

require'lspconfig'.clangd.setup{ on_attach = on_attach }
