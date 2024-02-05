local M = {
	"nvimtools/none-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
						vim.lsp.buf.format({ async = false })
						vim.lsp.buf.format({
							bufnr = bufnr,
							filter = function(client)
								return client.name == "null-ls"
							end,
						})
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
						-- vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
		debug = true,
		sources = {
			formatting.stylua,
			-- formatting.prettierd,
			formatting.phpcsfixer,
			formatting.biome,
			-- formatting.phpcbf.with({ extra_args = { "--standard=Drupal" } }),
			-- formatting.prettier.with {
			--   extra_filetypes = { "toml" },
			--   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			-- },
			-- formatting.eslint,
			-- null_ls.builtins.diagnostics.eslint,
			-- diagnostics.luacheck,
			diagnostics.phpstan,
			-- diagnostics.biome,
			-- null_ls.builtins.completion.spell,
		},
	})
end

return M
