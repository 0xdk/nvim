-- lua/plugins/fterm.lua
return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")

		-- Define global terminal for htop
		_G.htop = fterm:new({
			ft = "fterm_htop",
			cmd = "htop",
		})
	end,
}
