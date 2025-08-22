return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional but recommended
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>t",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
		},
	},
	opts = {
		close_if_last_window = false,
		enable_git_status = true,
		enable_diagnostics = true,
		filesystem = {
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		window = {
			width = 25,
		},
	},
}
