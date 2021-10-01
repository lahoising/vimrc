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

-- require'lspconfig'.clangd.setup{
-- 	capabilities = require('cmp_nvim_lsp').update_capabilities(\
-- 		vim.lsp.protocol.make_client.capabilities()\
-- 	)
-- }
require'lspconfig'.clangd.setup{}
