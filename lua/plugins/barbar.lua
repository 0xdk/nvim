-- in your lazy.lua plugin spec
return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional but recommended for icons
			"lewis6991/gitsigns.nvim", -- optional, if you want gitsigns integration
		},
		init = function()
			-- Barbar requires this setup before calling setup()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = false,
			tabpages = true,
			focus_on_close = "left",
			hide = { extensions = false, inactive = false },
			icons = {
				buffer_index = false,
				buffer_number = false,
				button = "",
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
				},
				gitsigns = {
					added = { enabled = true, icon = " " },
					changed = { enabled = true, icon = " " },
					deleted = { enabled = true, icon = " " },
				},
				separator = { left = "▎", right = "" },
				separator_at_end = true,
				modified = { button = "●" },
				pinned = { button = "", filename = true },
				alternate = { filetype = { enabled = false } },
				current = { buffer_index = true },
				inactive = { button = "×" },
				visible = { modified = { buffer_number = false } },
			},
			sidebar_filetypes = {
				NvimTree = true,
				undotree = { text = "undotree", align = "left" },
				["neo-tree"] = { event = "BufWipeout" },
				Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			},
			maximum_length = 25,
		},
	},
}
