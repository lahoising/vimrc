if has('nvim') && v:version >= 800
lua << EOF

	require('lspconfig').clangd.setup{}
	require('lspconfig').pyright.setup{}

	local omnisharp_bin = "/home/luis/.omnisharp/OmniSharp.Stdio.Driver/OmniSharp.exe"
	local pid = vim.fn.getpid()
	require('lspconfig').omnisharp.setup{
		--cmd = {'mono', omnisharp_bin, '--localserver', '--hostPID', tostring(pid)};
		cmd = {'mono', omnisharp_bin, '-lsp'};
	}

	local cmp = require'cmp'.setup()

EOF
else
	nnoremap <C-]> :YcmCompleter GoTo<CR>
end
