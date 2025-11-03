return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- Add keymap descriptions here
			defaults = {
				-- 	["<leader>d"] = { name = "duplicate file" },
				-- 	["<leader>p"] = { name = "toggle theme" },
				-- 	["<leader>u"] = { name = "open url" },
				-- 	["<leader>z"] = { name = "floating terminal" },
				-- 	["<leader>f"] = { name = "fzf" },
				-- 	["<leader>g"] = { name = "grep" },
				-- 	["<leader>G"] = { name = "grep under cursor" },
				-- 	["<leader>x"] = { name = "chmod +x" },
				-- 	["<leader>t"] = { name = "view files" },
				-- 	["<leader>R"] = { name = "reload config" },
				["<leader>vs"] = { name = "vsplit next buf" },
				-- 	["<leader>w"] = { name = "write" },
				-- 	["<leader>W"] = { name = "toggle wrap" },
				-- 	["<leader>q"] = { name = "close buf" },
				-- 	["<leader>Q"] = { name = "close all bufs!" },
				-- 	["<leader>U"] = { name = "close ALL buf" },
				-- 	["<leader>nn"] = { name = "toggle relative nums" },
				-- 	["<leader>hh"] = { name = "Move to previous buffer" },
				-- 	-- ["<leader>T"] = { name = "git status" },
				-- 	-- ["<leader>F"] = { name = "fzf opts" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
