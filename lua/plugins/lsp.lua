return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = function()
			-- Set up mason and mason-lspconfig
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "html", "cssls", "emmet_ls", "lua_ls" },
				automatic_installation = true,
			})

			-- Define capabilities from nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configering each language server separately

			-- TypeScript (ts_ls) configuration
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- TypeScript specific logic
					print("Attached to ts_ls")
				end,
			})

			-- HTML (html) configuration
			vim.lsp.config("html", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- HTML specific logic
					print("Attached to html")
				end,
			})

			-- CSS (cssls) configuration
			vim.lsp.config("cssls", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- CSS specific logic
					print("Attached to cssls")
				end,
			})

			-- Emmet (emmet_ls) configuration
			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Emmet specific logic
					print("Attached to emmet_ls")
				end,
			})

			-- Lua (lua_ls) configuration
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
				on_attach = function(client, bufnr)
					-- Lua specific logic
					print("Attached to lua_ls")
				end,
			})
		end,
	},
}
