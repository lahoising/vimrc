local cmp = require'cmp'

cmp.setup({
        snippet = {
                expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                end,
        },
        mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-u>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-j>'] = cmp.mapping.select_next_item(),
                ['<C-k>'] = cmp.mapping.select_prev_item(),
                ['<CR>'] = cmp.mapping.confirm({selected=false}),
        }),
        sources = {
                { name = 'nvim_lsp' },
                { name = 'vsnip' },
                { name = 'buffer' }
        }
})

cmp.DocumentationConfig = {}

local on_attach = function(client,bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
	vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
	vim.keymap.set('n', '<Leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)
end

# require'nvim-lsp-installer'.setup{}

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{ on_attach = on_attach }
lspconfig.pyright.setup{ on_attach = on_attach }
lspconfig.rust_analyzer.setup{ on_attach = on_attach }
