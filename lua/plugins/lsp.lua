return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"cssls",
					"emmet_ls",
					"lua_ls",
				},
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")

			local servers = {
				ts_ls = {},
				html = {},
				cssls = {},
				emmet_ls = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
						},
					},
				},
			}

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for name, config in pairs(servers) do
				config.capabilities = capabilities
				lspconfig[name].setup(config)
			end
		end,
	},
}
