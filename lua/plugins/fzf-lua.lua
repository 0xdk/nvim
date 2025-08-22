---@diagnostic disable: unused-local
return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
	opts = {},
	keys = {
		{

			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files in directory",
		},
		{
			"<leader>fg",
			"<cmd>FzfLua live_grep<CR>",
			desc = "FZF Live Grep",
		},

		{
			"<leader>fb",
			"<cmd>FzfLua buffers<CR>",
			desc = "FZF Buffers",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "FZF-Lua Builtin Pickers",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Find current word",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Find Resume",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Find old Files",
		},
	},
	config = function(_, pts)
		require("fzf-lua").setup(opts)
	end,
}
