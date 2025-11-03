return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			-- dashboard.section.header.val = {
			-- 	" ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
			-- 	" ████╗  ██║██║   ██║██║████╗ ████║",
			-- 	" ██╔██╗ ██║██║   ██║██║██╔████╔██║",
			-- 	" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			-- 	" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
			-- 	" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
			-- }
			-- Set menu buttons
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰍉  Find file", ":lua require('fzf-lua').files() <CR>"),
				dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
				dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/config/mappings.lua<CR>"),
				dashboard.button("b", "󰓩  Buffers", ":FzfLua buffers<CR>"),
				dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
			}

			-- Set footer
			dashboard.section.footer.val = ""

			alpha.setup(dashboard.config)
		end,
	},
}
