return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"marksman",
				"clangd",
				"pyright",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua", -- Lua formatter
				"clang-format", -- C/C++ formatter
				"markdownlint", -- Markdown linter
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				-- Optional: Format on save
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
				print("LSP started: " .. client.name)
			end

			-- Setup LSP servers
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.signatureHelpProvider = false
					on_attach(client, bufnr)
				end,
			})
		end,
	},
}
