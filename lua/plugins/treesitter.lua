return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "javascript", "html", "tsx" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true }, -- ✅ enable autotag here
			})
		end,
	},

	-- ✅ Add nvim-ts-autotag plugin separately
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
}
