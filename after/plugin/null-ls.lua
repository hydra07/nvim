local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
null_ls.setup({
	sources = {
		code_actions.refactoring,
		formatting.prettierd,
		formatting.stylua,

		--for python
		formatting.black.with({
			command = "black",
			args = { "--quiet", "--fast", "-" },
		}),
		diagnostics.ruff.with({
			command = "ruff",
		}),
	},
	-- on_attach = function(client, bufnr)
	--   if client.supports_method("textDocument/formatting") then
	--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	--     vim.api.nvim_create_autocmd("BufWritePre", {
	--       group = augroup,
	--       buffer = bufnr,
	--       callback = function()
	--         lsp_formatting(bufnr)
	--       end,
	--     })
	--   end
	-- end
	on_attach = function(client, bufnr)
		-- Enable formatting on sync
		if client.supports_method("textDocument/formatting") then
			local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = format_on_save,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(_client)
							return _client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
