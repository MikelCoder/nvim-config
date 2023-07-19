local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.eslint_d.with({
			filetypes = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
			},
		}),

		null_ls.builtins.formatting.lua_format,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.ltrs,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.autopep8,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					})
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
